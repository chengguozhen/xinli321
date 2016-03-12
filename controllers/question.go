package controllers

import (
	"github.com/astaxie/beego"
	"github.com/usual2970/xinli321/models"
	"github.com/astaxie/beego/orm"
)

type QuestionController struct {
	beego.Controller
}

func (c *QuestionController) Index() {
	o := orm.NewOrm()
    o.Using("default") // 默认使用 default，你可以指定为其他数据库
    var questions40,questions4 []models.Questions

    o.QueryTable("questions").OrderBy("-answer_num").Limit(4).All(&questions4)
	o.QueryTable("questions").OrderBy("-answer_num").Limit(40).All(&questions40)

	c.Data["questions4"]=questions4
	c.Data["questions40"]=questions40

	c.Layout = "layouts/main.tpl"
	c.TplName="question.tpl"
}
