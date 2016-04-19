// DIARY - RESPONSE
exports.login = function(request, response) {
			response.render('remember_login',{judul:"REMEMBER ME",idnya : request.session.idnya, usernamenya : request.session.username});
}

exports.team = function(request, response) {
			response.render('remember_teamprofile',{judul:"REMEMBER ME",idnya : request.session.idnya, usernamenya : request.session.username});
}

exports.error = function(request, response) {
			response.render('error',{judul:"REMEMBER ME",idnya : request.session.idnya, usernamenya : request.session.username});
}

exports.register = function(request, response) {
			response.render('remember_register',{judul:"REMEMBER ME",idnya : request.session.idnya, usernamenya : request.session.username});
}

exports.index = function(request, response) {
			request.getConnection(function(err,connect){
				var b = request.session.idnya;
    var qry = connect.query('SELECT * FROM view_index WHERE ID_USER = ? limit 4 ',b,function(errn,rows) {
      response.render('remember_index',{judul:"REMEMBER ME",data:rows, idnya : request.session.idnya, usernamenya : request.session.username});
    });
  })
}

exports.me = function(request, response) {
	var b = request.session.idnya;
			request.getConnection(function(err,connect){
    var qry = connect.query('SELECT * FROM user where ID_USER = ?',b,function(errn,rows) {
      response.render('remember_me',{judul:"REMEMBER ME",data:rows, idnya : request.session.idnya, usernamenya : request.session.username});
    });
  })
}

exports.meedit = function(request, response) {
	var b = request.session.idnya;
	request.getConnection(function (err, Conn) {
		Conn.query("select * from user where ID_USER = ? ",b,function (err,rows) {
		if (err) {
				console.log('error nya : %s',err);
			};
			response.render('remember_me_edit',{judul:"Ubah User Info",data:rows, idnya : request.session.idnya, usernamenya : request.session.username});
		}) 
	})
};


exports.meedit_simpan = function(request, response) {
	var ambil = JSON.parse(JSON.stringify(request.body));
	var b = request.session.idnya;
	request.getConnection(function (err, Conn) {
		var post = {
			NAMA_USER : ambil.nama_user,
			
			FB_USER : ambil.fb_user,
			TWIT_USER : ambil.twit_user,			
			BIO_USER : ambil.bio_user,
			ALAMAT_USER	 : ambil.alamat_user,
			NOMER_USER : ambil.nomer_user,
			EMAIL_USER : ambil.email_user
		};
		var qry = Conn.query("update user set ? where ID_USER = ?",[post,b],function (err,rows) {	
			if (err) {
				console.log("Error Di : %s",err);
			};
			response.redirect('/rememberme/me');
		})
	});
}
/*
exports.tambah_simpen = function(request, response) {
	var ambil = JSON.parse(JSON.stringify(request.body));
	request.getConnection(function (err, Conn) {
		var post = {
			ID_USER : ambil.idnya,
			NAMA_USER : ambil.nama,
			USERNAME_USER : ambil.username,
			PASSWORD_USER : ambil.password,
			FOTO_USER : ambil.gambar,
			FB_USER : ambil.facebook,
			TWIT_USER : ambil.twitter,
			BIO_USER : ambil.bio,
			ALAMAT_USER : ambil.alamat,
			NOMER_USER : ambil.notelp,
			EMAIL_USER : ambil.email
		};
		var user = ambil.username;
		var qry = Conn.query("insert into user set ? ",post,function (err,rows) {
			
			if (err) {
				console.log("Gagal Input Coeg ! :p Error Di : %s",err);
			};

			response.redirect('/rememberme/after_reg/'+user);
		})

	});
}*/

exports.tambah_simpen = function(req,res){
  //fungsi ambil gambar
  var multiparty = require("multiparty");
  var form = new multiparty.Form();
  form.parse(req,function(err,fields,files){
    var img = files.gambar[0];
    var fs = require("fs");
    gambar = img.originalFilename;
    //end fungsi ambil gambar

    var user = req.body.username;

    fs.readFile(img.path,function(err,data){
      var path = "./public/images/user/"+img.originalFilename;
      fs.writeFile(path,data,function(error){
        if(error) console.log(error);
        req.getConnection(function(err,connect){
          connect.query('INSERT INTO user values(?,?,?,?,?,?,?,?,?,?,?)',
            [ fields.idnya, fields.nama,fields.username, fields.password, gambar, fields.facebook, fields.twitter, fields.bio, fields.alamat, fields.notelp, fields.email],
            function(err, rows){
              res.redirect('/rememberme/after_reg/'+fields.username);
          });
        });
      });
    });
  });
};

exports.after_reg = function(request, response) {
	request.getConnection(function(err,connect){
		var b = request.params.usernya;
    var qry = connect.query('SELECT * FROM user where USERNAME_USER = ?',b,function(errn,rows) {
      if (err) {
        console.log('error nya : %s',err);
      };
       console.log('usernya : ',b);
      response.render('remember_meAfterReg',{judul:"REMEMBER ME",data:rows});
    });
  })
}




exports.lihatdiary = function(request, response) {
	request.getConnection(function(err,connect){
		var b = request.session.idnya;
    var qry = connect.query('SELECT * FROM sub_story where ID_USER = ? order by ID_STORY DESC',b,function(errn,rows) {

      if (err) {
        console.log('error nya : %s',err);
      };
      response.render('remember_listdiary',{judul:"REMEMBER ME",data:rows, idnya : request.session.idnya, usernamenya : request.session.username});
    });
  })
}

exports.lihatshareddiary = function(request, response) {
	request.getConnection(function(err,connect){
		var b = request.session.idnya;
    var qry = connect.query('SELECT * FROM sub_share where ID_USER = ?',b,function(errn,rows) {

      if (err) {
        console.log('error nya : %s',err);
      };
      response.render('remember_listshareddiary',{judul:"REMEMBER ME",data:rows, idnya : request.session.idnya, usernamenya : request.session.username});
    });
  })
}

exports.lihatshareddiarybyem = function(request, response) {
	request.getConnection(function(err,connect){
		var b = request.session.username;
    var qry = connect.query('SELECT * FROM sub_share where USERNAME_TEMAN_SHARE = ?',b,function(errn,rows) {

      if (err) {
        console.log('error nya : %s',err);
      };
      response.render('remember_listshareddiary_em',{judul:"REMEMBER ME",data:rows , idnya : request.session.idnya, usernamenya : request.session.username});
    });
  })
}


exports.tulisdiary = function(request, response) {
			response.render('remember_tulisdiary',{judul:"REMEMBER ME",idnya : request.session.idnya, usernamenya : request.session.username});
}

exports.tulisdiary_simpan = function(request, response) {
	var ambil = JSON.parse(JSON.stringify(request.body));
	var b = request.session.idnya;
	var c = b;
	request.getConnection(function (err, Conn) {
		var post = {
			ID_STORY : '',
			ID_USER : ambil.theid ,
			JUDUL_STORY : ambil.judul,
			TANGGAL_STORY : ambil.tanggal,
			MOOD_KATEGORI_STORY : ambil.mood,			
			STORY_STORY : ambil.diary
		};
		var qry = Conn.query('insert into sub_story set ? ',post, function(err, rows) {
			if (err) {
				console.log("gAGAL iNPUT ... Error Di : %s",err);
			};
			response.redirect('/rememberme/lihatdiary');
		})
	});
}

exports.bacadiary = function(request, response) {
	var idnya = request.params.id;
	var b = request.session.idnya;
	request.getConnection(function (err, Conn) {
		Conn.query("select * from view_index_baca where ID_USER = ? and ID_STORY = ? ",[b,idnya],function (err,rows) {
		if (err) {
				console.log('error nya : %s',err);
			};
			response.render('rememberme_bacadiary',{judul:"Baca Diary",data:rows, idnya : request.session.idnya, usernamenya : request.session.username});
		}) 
	})
}

exports.bacadiary_shared = function(request, response) {
	var ids = request.params.idstory;
	var idu = request.params.iduser;
	var b = request.session.idnya;
	request.getConnection(function (err, Conn) {
		Conn.query("SELECT * FROM `view_baca_share` WHERE ID_STORY = ? and ID_USER = ?",[ids,idu],function (err,rows) {
		if (err) {
				console.log('error nya : %s',err);
			};
			response.render('rememberme_bacadiary_shared',{judul:"Baca Diary",data:rows,idnya : request.session.idnya, usernamenya : request.session.username});
		}) 
	})
}



exports.editdiary = function(request, response) {
	var idnya = request.params.id;
	request.getConnection(function (err, Conn) {
		Conn.query("select * from sub_story where ID_STORY = ? ",idnya,function (err,rows) {
		if (err) {
				console.log('error nya : %s',err);
			};
			response.render('remember_editdiary',{judul:"Ubah Diary",data:rows , idnya : request.session.idnya, usernamenya : request.session.username});
		}) 
	})
}

exports.editdiary_simpan = function(request, response) {
	var ambil = JSON.parse(JSON.stringify(request.body));
	var idnya = request.params.id;
	request.getConnection(function (err, Conn) {
		var post = {
			ID_STORY : ambil.id,
			
			JUDUL_STORY : ambil.judul,
			TANGGAL_STORY : ambil.tanggal,
			MOOD_KATEGORI_STORY : ambil.mood,			
			STORY_STORY : ambil.diary
		};
		var qry = Conn.query("update sub_story set ? where ID_STORY = ?",[post,idnya],function (err,rows) {	
			if (err) {
				console.log(" Error Di : %s",err);
			};
			response.redirect('/rememberme/lihatdiary');
		})
	});
}

exports.hapusdiary = function(request, response){
		var idnya = request.params.id;
		request.getConnection(function (err, Conn) {
			
		var qry = Conn.query("delete from sub_story where ID_STORY = ?",idnya,function (err,rows) {
			if (err) {

				console.log("gagal delete ! gara gara : %s",err);
			};
			response.redirect('/rememberme/lihatdiary');
		});
		})
}

exports.caridiary = function(req, res) {
	var b = req.session.idnya;
			req.getConnection(function(err,connect){
     var qry = connect.query('SELECT JUDUL_STORY from sub_story where ID_USER = ? and JUDUL_STORY like "%'+req.query.key+'%" ',b, function(err, rows, fields) {
        var data=[];
    for(i=0;i<rows.length;i++)
      {
        data.push(rows[i].JUDUL_STORY);
      }
      res.end(JSON.stringify(data));
    });
  })
}

exports.carikandiary = function(request, response) {
	var idnya = request.body.formcaridiary;
	var b = request.session.idnya;
	request.getConnection(function (err, Conn) {
		Conn.query("select * from view_index_baca where ID_USER = ? and JUDUL_STORY = ? ",[b,idnya],function (err,rows) {
		if (rows.length > 0) {
			response.render('rememberme_bacadiary',{judul:"Baca Diary",data:rows, idnya : request.session.idnya, usernamenya : request.session.username});
				
			}else{
				response.render('error_caridiary',{judul:"Baca Diary Gagal", idnya : request.session.idnya, usernamenya : request.session.username});
				console.log('error nya : %s',err);
			};
			
		}) 
	})
};

//USER
exports.cariuser = function(req, res) {
	var b = req.session.idnya;
			req.getConnection(function(err,connect){	
     var qry = connect.query('SELECT USERNAME_USER from user where USERNAME_USER like "%'+req.query.key+'%"', function(err, rows, fields) {
        var data=[];
    for(i=0;i<rows.length;i++)
      {
        data.push(rows[i].USERNAME_USER);
      }
      res.end(JSON.stringify(data));
    });
  })
}

exports.carikanuser = function(request, response) {
	var idnya = request.body.formcariuser;
	request.getConnection(function (err, Conn) {
		Conn.query("select * from user where USERNAME_USER = ? ",idnya,function (err,rows) {
		if (err) {
				console.log('error nya : %s',err);
			};
			response.render('rememberme_bacadiary',{judul:"Baca Diary",data:rows,  idnya : request.session.idnya, usernamenya : request.session.username});
		}) 
	})
};

exports.hapusteman = function(request, response){
		var b = request.session.idnya;
		var idnya = request.params.id;
		request.getConnection(function (err, Conn) {
			
		var qry = Conn.query("delete from sub_contact where ID_TEMAN = ? and ID_USER = ? ",[idnya,b],function (err,rows) {
			if (err) {

				console.log("gagal delete! gara gara : %s",err);
			};
			response.redirect('/rememberme/lihatteman');
		});
		})
}

//TAMBAHKAN DIARY KE USER LAIN bagidiary
exports.bagidiary = function(req, res) {
	var b = req.session.idnya;
			req.getConnection(function(err,connect){
     var qry = connect.query('SELECT `KOLHELP_CONTACT`,`ID_TEMAN` FROM `sub_contact` WHERE ID_USER = ? and `KOLHELP_CONTACT` like "%'+req.query.key+'%"',b, function(err, rows, fields) {
        var data=[];
    for(i=0;i<rows.length;i++)
      {
        data.push(rows[i].KOLHELP_CONTACT);
      }
      res.end(JSON.stringify(data));
    });
  })
}

exports.bagikandiary = function(request, response) {
    var ambil = JSON.parse(JSON.stringify(request.body));
    var b = request.session.idnya;
	request.getConnection(function (err, Conn) {
		var post = {
			ID_SHARE : '',
			ID_STORY : ambil.idstory,
			ID_USER : ambil.iduser,
			USERNAME_TEMAN_SHARE : ambil.bagi,
			KOLHELP_SHARE : ambil.judul
		};
		var qry = Conn.query('insert into sub_share set ? ',post , function(err, rows) {
			if (qry) {
			response.redirect('/rememberme/lihatshareddiary');
			}else{
				response.render('error_caridiary',{judul:"Baca Diary Gagal", idnya : request.session.idnya, usernamenya : request.session.username});
				console.log('error nya : %s',err);
			};
		})
	});
}

exports.delete_shared = function(request, response){
		var idnya = request.params.id;
		var usernya = request.params.username;
		request.getConnection(function (err, Conn) {
			
		var qry = Conn.query("delete from sub_share where ID_STORY = ? and USERNAME_TEMAN_SHARE = ?",[idnya,usernya],function (err,rows) {
			if (err) {

				console.log("gagal delete! gara gara : %s",err);
			};
			response.redirect('/rememberme/lihatshareddiary');
		});
		})
}

//teman
exports.lihatteman = function(request, response) {
	var b = request.session.idnya;
			request.getConnection(function(err,connect){
    var qry = connect.query('SELECT * FROM sub_contact where ID_USER = ? ',b,function(errn,rows) {
      response.render('remember_listteman_detail',{judul:"REMEMBER ME",data:rows, idnya : request.session.idnya, usernamenya : request.session.username});
    });
  })
}

exports.tambahteman = function(request, response) {
			response.render('remember_tambahteman',{judul:"REMEMBER ME", idnya : request.session.idnya, usernamenya : request.session.username});
}


exports.cariteman = function(req, res) {
			req.getConnection(function(err,connect){	
     var qry = connect.query('SELECT USERNAME_USER from user where USERNAME_USER like "%'+req.query.key+'%"', function(err, rows, fields) {
        var data=[];
    for(i=0;i<rows.length;i++)
      {
        data.push(rows[i].USERNAME_USER);
      }
      res.end(JSON.stringify(data));
    });
  })
}

exports.carikanteman = function(request, response) {
	var idnya = request.body.formcariteman;
	request.getConnection(function (err, Conn) {
		Conn.query("select * from user where USERNAME_USER  = ? ",idnya,function (err,rows) {
		if (rows.length > 0) {
			response.render('remember_profilteman',{judul:"Profil Temanku",data:rows, idnya : request.session.idnya, usernamenya : request.session.username});
				
			}else{
				response.render('error_caridiary',{judul:"Baca Diary Gagal", idnya : request.session.idnya, usernamenya : request.session.username});
				console.log('error nya : %s',err);
			};
		}) 
	})
};

exports.carifulldiary = function(request, response) {
	var b = request.session.idnya;
	var idnya = request.body.caridiary;
	request.getConnection(function (err, Conn) {
		Conn.query("select * from sub_story where JUDUL_STORY like ? and ID_USER = ? ",['%'+idnya+'%',b],function (err,rows) {
		if (err) {
				console.log('error nya : %s',err);
			};
			response.render('remember_listdiary',{judul:"Baca Diary",data : rows, idnya : request.session.idnya, usernamenya : request.session.username});
			console.log('ini datanya : %s',rows);
		}) 
	})
};

exports.carifullteman = function(request, response) {
	var i = request.session.idnya;
	var idnya = request.body.cariteman;
	request.getConnection(function (err, Conn) {
		Conn.query("select * from user where USERNAME_USER like ? and ID_USER != ? ",['%'+idnya+'%',i],function (err,rows) {
		if (err) {
				console.log('error nya : %s',err);
			};
			response.render('remember_listteman_cari',{judul:"Baca Diary", dataku : rows, idnya : request.session.idnya, usernamenya : request.session.username});
			console.log('ini datanya : %s',rows);
		}) 
	})
};

exports.lihat_hasil_cari = function(request, response) {
	var idnya = request.params.id;
	request.getConnection(function (err, Conn) {
		Conn.query("select * from user where ID_USER  = ? ",idnya,function (err,rows) {
		if (err) {
				console.log('error nya : %s',err);
			};
			response.render('remember_profilteman',{judul:"Baca Diary",data:rows, idnya : request.session.idnya, usernamenya : request.session.username});
		}) 
	})
};

exports.tambah_teman = function(request, response) {
	var ambil = JSON.parse(JSON.stringify(request.body));
	var b = request.session.idnya;
	request.getConnection(function (err, Conn) {
		var post = {
			ID_KONTAK : '',
			ID_USER : b,
			ID_TEMAN : ambil.idnya,
			KOLHELP_CONTACT : ambil.username,
			KOLHELP_NAMAUSER : ambil.nama,
			KOLHELP_ALAMAT : ambil.alamat,
			KOLHELP_BIO : ambil.bio,
			KOLHELP_EMAIL : ambil.em,
			KOLHELP_FB : ambil.fb,
			KOLHELP_TWIT : ambil.twit,
			KOLHELP_TELP : ambil.no,
			KOLHELP_FOTO : ambil.foto

		};

		var qry = Conn.query("insert into sub_contact set ? ",post,function (err,rows) {
			
			if (err) {
				console.log("Gagal Input ! :p Error Di : %s",err);
			};

			response.redirect('/rememberme/lihatteman');
		})

	});
}
