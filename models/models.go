package models

import (
    "github.com/astaxie/beego/orm"
    "time"
)



type Snapshots struct {
    Id          int   `orm:"pk"`
    FtfPrice  float64
    ArticleNum   int
    PraiseNum int
    ConsultNum int
    AnswerNum int
    SnapAt time.Time  `orm:"auto_now_add;type(date)"`

    Experts *Experts `orm:"rel(fk)"` // RelForeignKey relation
}


type Experts struct {

  Id string `orm:"pk"`
  OriginId string
  SiteId int
  Name string
  OriginUrl string
  Title string
  GoodAt string
  City string
  HeadUrl string
  Desc string
  Brief string
  FtfPrice float64
  ArticleNum int
  PraiseNum int
  ConsultNum int
  AnswerNum int
  Snapshots []*Snapshots `orm:"reverse(many)"` // fk 的反向关系
}

func init() {
    // 需要在init中注册定义的model
    orm.RegisterModel(new(Experts),new(Snapshots))
}
