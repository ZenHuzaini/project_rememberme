var http = require('http');
var express = require('express');
var path = require('path');
var session = require("express-session");
var fs = require("fs");

/*var logger = require('morgan');
var favicon = require('serve-favicon');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');*/
var conn = require('express-myconnection');
var mysql = require('mysql');


var rememberme = require('./routes/rememberme');
var app =express();

app.set('port',process.env.PORT || 1996);
app.set('views',path.join(__dirname, 'views'));
app.set('view engine','ejs');

app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({resave: true, saveUninitialized: true, secret: 'zenhuzainitheboyonfire', cookie: { maxAge: 10000000000 }}));

if ('development' - app.get('env')) {
	app.use(express.errorHandler());
};

if (app.get('env') === 'development') {
  app.locals.pretty = true;
}

app.use(
		conn(mysql,{
			host: '127.0.0.1',
			user: 'root',
			password: '',
			port: 3306,
			database:'proj_rememberme'
		},'single')
	);
/*
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'proj_diary_rememberme'
});*/

app.get('/rememberme',rememberme.login);

app.get('/rememberme/error',rememberme.error);
app.get('/rememberme/register',rememberme.register);
app.post('/rememberme/register',rememberme.tambah_simpen);
app.get('/rememberme/after_reg/:usernya',rememberme.after_reg);

app.post("/rememberme/index", function(req, res) {
	var idnya = req.body.idnya;
	var username = req.body.username;

    req.session.idnya = idnya;
    var b = req.session.idnya;

    req.session.username = username;
    var c = req.session.username;

    console.log("session ini ke : %s",b);

	req.getConnection(function (err, Conn) {
    var qry = Conn.query("select * from view_index where ID_USER = ? and USERNAME_USER = ? limit 4",[b,c],function (err,rows) {
			if (rows.length > 0) {
				res.render("remember_index", { judul: "Remember Me", data : rows, idnya : req.session.idnya, usernamenya : req.session.username});
			}else{
				res.render('error',{judul:"REMEMBER ME",idnya : req.session.idnya, usernamenya : req.session.username});
				console.log("gagal login bro! gara gara : %s",err);
			};
		});
}) 
});

//tampilan_awal

app.get('/rememberme/index',rememberme.index);
app.get('/rememberme/team',rememberme.team);

//ADMIN
app.get('/rememberme/me',rememberme.me);
app.get('/rememberme/meedit/:id', rememberme.meedit);
app.post('/rememberme/meedit/:id', rememberme.meedit_simpan);


//proses diary
app.get('/rememberme/bacadiary/:id',rememberme.bacadiary)
app.get('/rememberme/lihatdiary',rememberme.lihatdiary);
app.get('/rememberme/lihatshareddiary',rememberme.lihatshareddiary);
app.get('/rememberme/lihatshareddiarybyem',rememberme.lihatshareddiarybyem);
app.get('/rememberme/bacadiary_shared/:idstory/:iduser',rememberme.bacadiary_shared);
app.get('/rememberme/delete_shared/:id/:username',rememberme.delete_shared);
app.get('/rememberme/tulisdiary',rememberme.tulisdiary);
app.post('/rememberme/tulisdiary',rememberme.tulisdiary_simpan);
app.get('/rememberme/editdiary/:id',rememberme.editdiary);
app.post('/rememberme/editdiary/:id',rememberme.editdiary_simpan);
app.get('/rememberme/hapusdiary/:id',rememberme.hapusdiary);
app.get('/rememberme/caridiary',rememberme.caridiary);
app.post('/rememberme/carikandiary',rememberme.carikandiary);
app.get('/rememberme/cariuser',rememberme.cariuser);
app.post('/rememberme/carikanuser/:username',rememberme.carikanuser);

//see friends
app.get('/rememberme/lihatteman',rememberme.lihatteman);

//tambahkan teman
app.get('/rememberme/tambahteman',rememberme.tambahteman);

app.get('/rememberme/cariteman',rememberme.cariteman);

app.post('/rememberme/carifullteman',rememberme.carifullteman);
app.post('/rememberme/carifulldiary',rememberme.carifulldiary);

app.get('/rememberme/lihat_hasil_cari/:id',rememberme.lihat_hasil_cari);

app.post('/rememberme/carikanteman',rememberme.carikanteman);
app.post('/rememberme/tambah_teman',rememberme.tambah_teman);
//adduser
app.get('/rememberme/bagidiary',rememberme.bagidiary);
app.post('/rememberme/bagikandiary',rememberme.bagikandiary);
//deluser
app.get('/rememberme/hapusteman/:id',rememberme.hapusteman);

//UNTUK GET DIARY
app.get('/rememberme/lamanawal',rememberme.lihatdiary);




app.use(app.router);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Server Is Running On Port : ' + app.get('port'));
});