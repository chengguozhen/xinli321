<link type="text/css" rel="stylesheet" href="/static/css/owl.carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="/static/css/owl.theme.css" rel="stylesheet">

<div id="page-content">
  <div class="container">
    <div class="top-content">
          <div id="top-slide" class="owl-carousel">
          	{{range $key,$val:=.questions4}}
            <div class="item">
              <a href="{{$val.OriginUrl}}" target="_blank" title="{{$val.Title}}">
                <img src="/static/img/qbanner/{{$val.Id|mod12}}.jpeg"
                alt="{{$val.Title}}">
              </a>
              <div class="slider-content">
                <div class="slider-content-box">
                  <div class="post-categories clearfix">
                    <a href="{{$val.OriginUrl}}">
                      {{$val.Tags}}
                    </a>
                  </div>
                  <div class="slider-title">
                    <h2>
                      <a href="{{$val.OriginUrl}}" target="_blank">
                        {{$val.Title}}
                      </a>
                    </h2>
                  </div>
                  <div class="post-element clearfix">
                    <ul>
                      
                      <li class="post-slider-views">
                        <i class="icon-reply">
                        </i>
                        {{$val.AnswerNum}}
                      </li>
                    </ul>
                  </div>
                  <div class="slider-post-text clearfix">
                    <p class="posts-gallery-text">
                      {{substr $val.Content 0 100}}...
                    </p>
                  </div>
                  <div class="read-more">
                    <a href="{{$val.OriginUrl}}" target="_blank">
                      阅读全文
                    </a>
                  </div>
                </div>
              </div>
            </div>
            {{end}}
           
          </div>
          
        </div>



    <div class="posts">
      <div class="posts-box">
        <div class="ajax-load-box posts-con">

        {{range $key,$val:=.questions40}}
          <li class="ajax-load-con content">
            <div class="content-box posts-aside">
              <div class="posts-default-content">
                <div class="posts-default-title">
                  <div class="post-entry-categories">
                    <a href="{{$val.OriginUrl}}" target="_blank" rel="tag">
                      {{$val.Tags}}
                    </a>
                    
                  </div>
                  <h2>
                    <a href="{{$val.OriginUrl}}" target="_blank" title="{{$val.Title}}">
                      {{$val.Title}}
                    </a>
                  </h2>
                </div>
                <div class="posts-text">
                  {{$val.Content}}
                </div>
                <div class="posts-default-info">
                  <ul>
                    
                    <li class="ico-reply">
                      <i class="icon-reply">
                      </i>
                      {{$val.AnswerNum}}
                    </li>
                    <li class="ico-eye">
                      <i class="icon-eye-1">
                      </i>
                      <a href="{{$val.OriginUrl}}" target="_blank" title="{{$val.Title}}">查看咨询师回复</a>
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
                  <a href="https://www.suxing.me" target="_blank" class="social_a social_weibo"
                  rel="nofollow" title="新浪微博">
                    <i class="icon-weibo">
                    </i>
                  </a>
                  <a href="https://www.suxing.me" target="_blank" class="social_a social_tencent"
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
<script type='text/javascript' src='/static/js/owl.carousel.min.js'></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
	var owl = $('.owl-carousel'); 
	owl.owlCarousel({
	 	items: 1,
	 	loop:true,
	 	animateOut: 'fadeOut',
	  	autoplay:true,
	  	autoplayTimeout:3000,
	  	responsive:{	
		    765:{
		      items:1
		    }
		}
	});
 });
</script>
