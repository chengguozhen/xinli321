<div id="page-content">
  <div class="container">
    <div class="posts">
      <div class="posts-box">
        <div class="ajax-load-box posts-con">



          <div class="ajax-load-con content">
            <a title="心理321" href="" target="_blank">
              <img src="{{.banner}}" alt="今日热门咨询师">
            </a>
            <div class="banner-title">
                  
                  <h4>
                    <a style="color:#fff;" href="http://grace.iwpzt.com/969.html" title="{{.today}}，被赞最多的咨询师">
                      {{.bannerTitle}}
                    </a>
                  </h4>
                </div>     
          </div>
          {{range $key, $val := .data}}


          <li class="ajax-load-con content">
            <div class="content-box posts-gallery-box">
              <div class="posts-gallery-img">
                <a href="{{$val.Experts.OriginUrl}}" target="_blank" title="{{$val.Experts.Name}}">
                  <img class="lazy thumbnail" data-original="/static/img/experts/{{$val.Experts.SiteId}}/160/{{$val.Experts.Id}}.jpg"
                  src="/static/img/thumbnail-small.png" alt="{{$val.Experts.Name}}--{{$val.Experts.Title}}"
                  style="display: inline-block;">
                </a>
              </div>
              <div class="posts-gallery-content">
                <h2>
                  <a href="{{$val.Experts.OriginUrl}}" target="_blank" title="{{$val.Experts.Name}}">
                    {{$val.Experts.Name}}——{{$val.Experts.Title}}
                  </a>
                </h2>
                <div class="posts-gallery-text">
                  {{substr (html2str $val.Experts.GoodAt) 0 200}}
                </div>
                <div class="posts-default-info">
                  <ul>
                   
                    <li class="ico-money">
                      <i class="icon-money">
                      </i>
                      <a  href="{{$val.Experts.OriginUrl}}" target="_blank">
                        {{$val.Experts.FtfPrice}}元
                      </a>
                    </li>
                    <li class="ico-reply">
                      <i class="icon-reply">
                      </i>
                      {{$val.Experts.AnswerNum}}
                    </li>
                    <li class="ico-article">
                      <i class="icon-article">
                      </i>
                      {{$val.Experts.ArticleNum}}
                    </li>
                    <li class="ico-thumbs-up">
                      <i class="icon-thumbs-up">
                      </i>
                      {{$val.Experts.PraiseNum}}
                    </li>
                    <li class="">
                      <i class="icon-address">
                      </i>
                      {{$val.Experts.City}}
                    </li>

                  </ul>
                </div>
              </div>
            </div>
          </li>

          {{end}} 


          


        </div>
        <div class="clearfix">
        </div>
        <div id="ajax-load-posts">
          <a id="fa-loadmore" href="/{{.pagination.prePage}}" class="button button-more" data-category="12"
          data-paged="2" data-action="fa_load_postlist" data-total="3" style="padding:0 15px;width:auto;">
            {{.pagination.preStr}}
          </a>

          <a id="fa-loadmore" href="/{{.pagination.nextPage}}" class="button button-more" data-category="12"
          data-paged="2" data-action="fa_load_postlist" data-total="3" style="padding:0 15px;width:auto;">
            {{.pagination.nextStr}}
          </a>
        </div>
      </div>
      <div class="sidebar sidebar-right">
        <div class="sidebar-box">

          <div class="widget suxingme_social" style="top: 0px;">
            <div class="widget_box">
              <div class="attentionus">
                <p class="title">
                  <span>
                    关注我们 么么哒！
                  </span>
                </p>
                <ul class="items clearfix">
                  <a href="https://www.suxing.me/" target="_blank" class="social_a social_weibo"
                  rel="nofollow" title="新浪微博">
                    <i class="icon-weibo">
                    </i>
                  </a>
                  <a href="https://www.suxing.me/" target="_blank" class="social_a social_tencent"
                  rel="nofollow" title="腾讯微博">
                    <i class="icon-tencent-weibo">
                    </i>
                  </a>
                  <a href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&amp;email=suxingme@qq.com"
                  target="_blank" class="social_a social_email" rel="nofollow" title="邮箱">
                    <i class="icon-mail">
                    </i>
                  </a>
                  <div class="dropdown-menu-part">
                    <a id="tooltip-qq" href="javascript:void(0);" onclick="return false;"
                    target="_blank" class="social_a social_qq" rel="nofollow" title="QQ:25679903">
                      <i class="icon-qq">
                      </i>
                    </a>
                    <div class="dropdown-menu qq-dropdown">
                      <p>
                        <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=25679903&amp;site=qq&amp;menu=yes">
                          25679903
                        </a>
                      </p>
                    </div>
                  </div>
                </ul>
              </div>
            </div>
          </div>

          <div class="widget widget_suxingme_hotpost">
            <div class="widget_box">
              <h3>
                更多咨询师
              </h3>
              <li>
                <a class="img" href="/1" title="{{.today}}，昨日被赞最多的咨询师">
                  <i class="icon-forward">
                  </i>
                  <img class="lazy thumbnail" data-original="{{.praiseBanner}}"
                  src="/static/img/thumbnail-small.png" alt="{{.today}}，昨日被赞最多的咨询师"
                  style="display: inline-block;">
                </a>
                <div class="title">
                  
                  <h4>
                    <a href="/1" title="{{.today}}，昨日被赞最多的咨询师">
                      {{.today}}，昨日被赞最多的咨询师
                    </a>
                  </h4>
                </div>
              </li>
              <li>
                <a class="img" href="/2" title="{{.today}}，昨日回复最多的咨询师">
                  <i class="icon-forward">
                  </i>
                  <img class="lazy thumbnail" data-original="{{.answerBanner}}"
                  src="/static/img/thumbnail-small.png" alt="{{.today}}，昨日回复最多的咨询师"
                  style="display: inline-block;">
                </a>
                <div class="title">
                  
                  <h4>
                    <a href="/2" title="{{.today}}，昨日回复最多的咨询师">
                      {{.today}}，昨日回复最多的咨询师
                    </a>
                  </h4>
                </div>
              </li>
              <li>
                <a class="img" href="/3" title="{{.today}}，昨日咨询最多的咨询师">
                  <i class="icon-forward">
                  </i>
                  <img class="lazy thumbnail" data-original="{{.consultBanner}}"
                  src="/static/img/thumbnail-small.png" alt="{{.today}}，昨日咨询最多的咨询师"
                  style="display: inline-block;">
                </a>
                <div class="title">
                 
                  <h4>
                    <a href="/3" title="{{.today}}，昨日咨询最多的咨询师">
                      {{.today}}，昨日咨询最多的咨询师
                    </a>
                  </h4>
                </div>
              </li>
              <li>
                <a class="img" href="/4" title="{{.today}}，昨日文章最多的咨询师">
                  <i class="icon-forward">
                  </i>
                  <img class="lazy thumbnail" data-original="{{.articleBanner}}"
                  src="/static/img/thumbnail-small.png" alt="{{.today}}，昨日文章最多的咨询师"
                  style="display: inline-block;">
                </a>
                <div class="title">
                  
                  <h4>
                    <a href="/4" title="{{.today}}，昨日文章最多的咨询师">
                      {{.today}}，昨日文章最多的咨询师
                    </a>
                  </h4>
                </div>
              </li>

              <li>
                <a class="img" href="/5" title="{{.today}}，昨日价格最低的咨询师">
                  <i class="icon-forward">
                  </i>
                  <img class="lazy thumbnail" data-original="{{.priceBanner}}"
                  src="/static/img/thumbnail-small.png" alt="{{.today}}，昨日价格最低的咨询师"
                  style="display: inline-block;">
                </a>
                <div class="title">
                  
                  <h4>
                    <a href="/5" title="{{.today}}，昨日价格最低的咨询师">
                      {{.today}}，昨日价格最低的咨询师
                    </a>
                  </h4>
                </div>
              </li>
            </div>
          </div>

          
          <div class="widget widget_links">
            <div class="widget_box">
              <h3>
                好基友
              </h3>
              <ul class="xoxo blogroll">
                <li>
                  <a href="http://www.1dian7.com/" title="一点骑单车俱乐部" target="_blank">
                    一点骑单车俱乐部
                  </a>
                </li>
                <li>
                  <a href="http://www.joneto.com" title="囧途网" target="_blank">
                    囧途网
                  </a>
                </li>
                <li>
                  <a href="http://www.yidianling.com" title="心理壹点灵" target="_blank">
                    心理壹点灵
                  </a>
                </li>
              </ul>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>