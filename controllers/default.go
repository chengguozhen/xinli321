package controllers

import (
	"github.com/astaxie/beego"
	"github.com/usual2970/xinli321/models"
	"github.com/usual2970/xinli321_spider/config"
	"time"
	"github.com/astaxie/beego/orm"
	"os"
	"image"
	"image/jpeg"
	"fmt"
	"strconv"
	"image/draw"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	o := orm.NewOrm()
    o.Using("default") // 默认使用 default，你可以指定为其他数据库

    //分页处理
    page,_:=c.GetInt(":page")
    if page==0{
    	page=1
    }
    

    var list orm.ParamsList
   	o.Raw("select count(distinct(snap_at)) from snapshots").ValuesFlat(&list)
   	dateNum,_:=strconv.Atoi(list[0].(string))
    pageCount:=int(dateNum*5)
    if page>pageCount{
    	page=pageCount
    }


    bannerTypeArr:=[]string{"praise","answer","article","consult","price"}
    bannerType:=bannerTypeArr[(page-1)%5]


    var snapshots []models.Snapshots

    durationDate:=0-int((page-1)/5)
    snapAt:=time.Now().AddDate(0,0,durationDate).Format("2006-01-02")

    bannerTypes:=map[string]string{
    	"praise":"，昨日被赞最多咨询师",
    	"answer":"，昨日回复最多咨询师",
    	"article":"，昨日文章最多咨询师",
    	"consult":"，昨日咨询最多咨询师",
    	"price":"历史价格最低咨询师",
    }
    if _,ok:=bannerTypes[bannerType];ok==false{
    	c.Abort("404")
    }


    //上一页、下一页
    prePage:=page-1
    if prePage<=1{
    	prePage=1
    }
    preDurationDate:=0-int((prePage-1)/5)
    preSnapAt:=time.Now().AddDate(0,0,preDurationDate).Format("2006-01-02")
    preBannerTitle:=bannerTypes[bannerTypeArr[(prePage-1)%5]]

    nextPage:=page+1
    if nextPage>=pageCount{
    	nextPage=pageCount
    }
    nextDurationDate:=0-int((nextPage-1)/5)
    nextSnapAt:=time.Now().AddDate(0,0,nextDurationDate).Format("2006-01-02")
    nextBannerTitle:=bannerTypes[bannerTypeArr[(nextPage-1)%5]]

    pagination:=map[string]string{
    	"preStr":preSnapAt+preBannerTitle,
    	"nextStr":nextSnapAt+nextBannerTitle,
    	"prePage":strconv.Itoa(prePage),
    	"nextPage":strconv.Itoa(nextPage),

    }
    c.Data["pagination"]=pagination

    var sort,bannerTitle string
    switch bannerType{
    	case "praise":
    		sort="-praise_num"
    		bannerTitle=snapAt+"，昨日被赞最多咨询师"
    	case "answer":
    		sort="-answer_num"
    		bannerTitle=snapAt+"，昨日回复最多咨询师"
    	case "article":
    		sort="-article_num"
    		bannerTitle=snapAt+"，昨日文章最多咨询师"
    	case "consult":
    		sort="-consult_num"
    		bannerTitle=snapAt+"，昨日咨询最多咨询师"
    	case "price":
    		sort="experts__ftf_price"
    		bannerTitle=snapAt+"，历史价格最低咨询师"

    }
    
	o.QueryTable("snapshots").Filter("Snapat", snapAt).OrderBy(sort).Limit(40).RelatedSel("experts").All(&snapshots)
	c.Data["data"]=snapshots

	hotPicPath:=config.ImagePath+"banner/hot/"
	datePath:=hotPicPath+snapAt+"/"
	if isDirectoryExist(datePath)==false{
		os.Mkdir(datePath,os.ModePerm)
	}
	answerPic:=datePath+bannerType+".jpg"
	if isFileExist(answerPic)==false{

		genBanner(snapshots,answerPic)
	}
	today:=time.Now().Format("2006-01-02")
	c.Data["articleBanner"]="/static/img/banner/hot/"+today+"/article.jpg"
	c.Data["answerBanner"]="/static/img/banner/hot/"+today+"/answer.jpg"
	c.Data["consultBanner"]="/static/img/banner/hot/"+today+"/consult.jpg"
	c.Data["priceBanner"]="/static/img/banner/hot/"+today+"/price.jpg"
	c.Data["praiseBanner"]="/static/img/banner/hot/"+today+"/praise.jpg"
	c.Data["today"]=today
	c.Data["banner"]="/static/img/banner/hot/"+snapAt+"/"+bannerType+".jpg"
	c.Data["bannerTitle"]=bannerTitle
	c.Layout = "layouts/main.tpl"
	c.TplName="index.tpl"


}


func isDirectoryExist(dic string) bool{
	fi,err:=os.Stat(dic)
	if err!=nil{
		return os.IsExist(err)

	}else{
		return fi.IsDir()
	}
}

func isFileExist(file string) bool{
	_,err:=os.Stat(file)
	if err!=nil{
		return os.IsExist(err)

	}else{

	}

	return true;

}

func genBanner(snapshots []models.Snapshots,targetPath string){
	file, err := os.Create(targetPath)
	if err != nil {
		fmt.Println(err)
	}
	defer file.Close()
	jpg := image.NewRGBA(image.Rect(0, 0, 800, 320))




	expertPicPath:=config.ImagePath+"experts/"
	for i:=0;i<len(snapshots);i++{
		
		fileName:=expertPicPath+strconv.Itoa(snapshots[i].Experts.SiteId) +"/80/"+snapshots[i].Experts.Id+".jpg"
		file, err := os.Open(fileName)
		fmt.Println(err)
		if err != nil {

			println(fileName)
			continue
		}
		var img image.Image


		img, err = jpeg.Decode(file)
		println(fileName)
		

		column:=0-int(i/10)*80
		line:=0-int(i%10)*80

		draw.Draw(jpg, jpg.Bounds(), img, image.Pt(line,column), draw.Src)

		file.Close()
	}

	jpeg.Encode(file, jpg, nil)

}