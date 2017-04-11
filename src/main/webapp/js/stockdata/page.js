/* 一个简单的分页，每次点击重渲染
 * 点击选页按钮触发事件choosePageNumber(a)和stockListTable(i)
 ******by wuati*****
 */
(function ($) {
  //默认参数 (放在插件外面，避免每次调用插件都调用一次，节省内存)
  var defaults = {
    //id : '#paging',//id
    leng: 9,//总页数
    activeClass: 'page-active' ,//active类
    firstPage: '«',//
    lastPage: '»',
    prv: '<',//<a href=# disabled><i class="icon ion-chevron-left"></i></a>
    next: '>',//<a href=#2><i class="icon ion-chevron-right"></i></a>
  };
  //扩展
  $.fn.extend({
    //插件名称
    page: function (options) {
      //覆盖默认参数
      var opts = $.extend(defaults, options);
      //主函数
      return this.each(function () {
        //激活事件
        var obj = $(this);
        var str1 = '';
        var str = '';
        var l = opts.leng;
        if (l > 1&&l < 10) {
          str1 = '<li><a onclick="choosePageNumber(this)" class="'+ opts.activeClass +'">1</a></li>';
          for (i = 2; i < l + 1; i++) {
            str += '<li><a onclick="choosePageNumber(this)">' + i + '</a></li>';
          }
        }else if(l > 9){
          str1 = '<li><a href="javascript:" class="'+ opts.activeClass +'">1</a></li>';
          for (i = 2; i < 10; i++) {
            str += '<li><a onclick="choosePageNumber(this)">' + i + '</a></li>';
          }
          //str += '<li><a href="javascript:">...</a></li>'
        } else {
          str1 = '<li><a onclick="choosePageNumber(this)" class="'+ opts.activeClass +'">1</a></li>';
        }
        obj.html('<div class="next" style="float:right">' + opts.next + '</div><div class="last" style="float:right">' + opts.lastPage + '</div><ul class="pagingUl">' + str1 + str + '</ul><div class="first" style="float:right">' + opts.firstPage + '</div><div class="prv" style="float:right">' + opts.prv + '</div>');

        obj.on('click', '.next', function () {
          var pageshow = parseInt($('.' + opts.activeClass).html());
          if(pageshow == l) {
          }else if(pageshow > l-5&&pageshow < l){
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().next().find('a').addClass(opts.activeClass);
            stockListTable(pageshow+1);
          }else if(pageshow > 0&&pageshow < 6){
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().next().find('a').addClass(opts.activeClass);
            stockListTable(pageshow+1);
          }else {
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().next().find('a').addClass(opts.activeClass);
            stockListTable(pageshow+1);
            fpageShow();
          }
        });
        obj.on('click', '.prv', function () {
          var pageshow = parseInt($('.' + opts.activeClass).html());
          if (pageshow == 1) {
          }else if(pageshow > l-5&&pageshow < l+1){
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);
            stockListTable(pageshow-1);
                  //this.fpageBranch(pageshow-1);
          }else if(pageshow > 1&&pageshow < 6){
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);
            stockListTable(pageshow-1);      
            //this.fpageBranch(pageshow-1);
          }else {
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);
                    //this.fpageBranch(pageshow-1);
            stockListTable(pageshow-1);
            fpageShow();
            
          }
        });

        obj.on('click', '.first', function(){
          var pageshow = 1;
          $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);
          stockListTable(1);
          fpagePrv(0);
        })
        obj.on('click', '.last', function(){
          var pageshow = l;
          if(l>9){
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);
            lastPage();
            fpageNext(8);
          }else{
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);
            lastPage();
            fpageNext(l-1);
          }
        })

        obj.on('click', 'li', function(){
          var $this = $(this);
          var pageshow = $this.find('a').html();
          if(l>9){
            if(pageshow > l-5&&pageshow < l+1){
              $('.' + opts.activeClass).removeClass(opts.activeClass);
              $this.find('a').addClass(opts.activeClass);
              fpageNext(8-(l-pageshow));
            }else if(pageshow > 0&&pageshow < 5){
              $('.' + opts.activeClass).removeClass(opts.activeClass);
              $this.find('a').addClass(opts.activeClass);
              fpagePrv(pageshow-1);
            }else{
              $('.' + opts.activeClass).removeClass(opts.activeClass);
              $this.find('a').addClass(opts.activeClass);
              fpageShow();
            }
          }else{
            $('.' + opts.activeClass).removeClass(opts.activeClass);
            $this.find('a').addClass(opts.activeClass);
          }
          
        })

        function fpageShow(){
          var pageshow = parseInt($('.' + opts.activeClass).html());
          var pageStart = pageshow - 4;
          var pageEnd = pageshow + 5;
          var str1 = '';
          for(i=0;i<9;i++){
            str1 += '<li><a onclick="choosePageNumber(this)" class="">' + (pageStart+i) + '</a></li>'
          }
          obj.find('ul').html(str1);
          obj.find('ul li').eq(4).find('a').addClass(opts.activeClass);
        }

        function fpagePrv(prv){
          var str1 = '';
          if(l>8){
            for(i=0;i<9;i++){
              str1 += '<li><a onclick="choosePageNumber(this)" class="">' + (i+1) + '</a></li>'
            }
          }else{
            for(i=0;i<l;i++){
              str1 += '<li><a onclick="choosePageNumber(this)" class="">' + (i+1) + '</a></li>'
            }
          }
          obj.find('ul').html(str1);
          obj.find('ul li').eq(prv).find('a').addClass(opts.activeClass);
        }

        function fpageNext(next){
          var str1 = '';
          if(l>8){
            for(i=l-8;i<l+1;i++){
              str1 += '<li><a onclick="choosePageNumber(this)" class="">' + i + '</a></li>'
            }
           obj.find('ul').html(str1);
           obj.find('ul li').eq(next).find('a').addClass(opts.activeClass);
          }else{
            for(i=0;i<l;i++){
              str1 += '<li><a onclick="choosePageNumber(this)" class="">' + (i+1) + '</a></li>'
            }
           obj.find('ul').html(str1);
           obj.find('ul li').eq(next).find('a').addClass(opts.activeClass);
          }
        }
      });
    }
  })
})(jQuery);