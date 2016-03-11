package routers

import (
	"github.com/usual2970/xinli32/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
    beego.Router("/:page(\\d+)", &controllers.MainController{})
    beego.AutoRouter(&controllers.CommentController{})
    beego.AutoRouter(&controllers.AboutController{})
}
