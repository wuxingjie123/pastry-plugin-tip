#!/usr/bin/env node
var fs = require('fs');

 fs.exists('/Users/dongyang/Desktop/aaa.txt', function (exists) {

     if (exists) {

        fs.rename('/Users/dongyang/Desktop/aaa.txt', '/Users/dongyang/Desktop/myDyy/aaa.txt', function (err) {

            if(err) {

                console.error('移动文件出错了');

                return;

            }

            console.log('移动文件夹成功')

        });

     }
     else {

      console.log('文件不存在');
     };



        });
 


 