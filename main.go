package main

import (
	_ "github.com/usual2970/xinli321/routers"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"fmt"
	_ "github.com/go-sql-driver/mysql"

)

var Cfg = beego.AppConfig

func main() {

	initGlobal()


	beego.Run()


}

func initGlobal(){
	//初始化数据库连接
	dbUser := Cfg.String("dbuser")
	dbPass := Cfg.String("dbpass")
	dbHost := Cfg.String("dburl")
	dbPort := Cfg.String("dbport")
	dbName := Cfg.String("dbname")
	maxIdleConn, _ := Cfg.Int("db_max_idle_conn")
	maxOpenConn, _ := Cfg.Int("db_max_open_conn")
	dbLink := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8", dbUser, dbPass, dbHost, dbPort, dbName) + "&loc=Asia%2FChongqing&allowOldPasswords=1"

	orm.RegisterDriver("mysql", orm.DRMySQL)
	orm.RegisterDataBase("default", "mysql", dbLink, maxIdleConn, maxOpenConn)
	

}