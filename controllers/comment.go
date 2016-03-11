package controllers

import (
	"github.com/astaxie/beego"
)

type CommentController struct {
	beego.Controller
}

func (c *CommentController) Index() {
	c.Layout = "layouts/main.tpl"

	c.TplName="comment.tpl"
}
