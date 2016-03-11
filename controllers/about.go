package controllers

import (
	"github.com/astaxie/beego"
)

type AboutController struct {
	beego.Controller
}

func (c *AboutController) Here() {
	c.Layout = "layouts/main.tpl"

	c.TplName="here.tpl"
}


func (c *AboutController) Log() {
	c.Layout = "layouts/main.tpl"

	c.TplName="log.tpl"
}
