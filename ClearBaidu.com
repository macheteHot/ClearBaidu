// ==UserScript==
// @name         ClearBaidu
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  try to take over the world!
// @author       Machete
// @match        https://www.baidu.com/*
// @grant        none
// ==/UserScript==

(function () {
    'use strict';

    function show() {
        $('#u1').remove();
        $('#lg').remove();
        $('.qrcodeCon').remove();
        $('#ftCon').remove();
        $('.leftBlock').remove();
        $('#content_right').remove();
        $('#su').val('凑合一下');
        $('.headBlock').remove();
        var divlist = $('#content_left div');
        $.each(divlist, function (index, value) {
            var id = $(value).attr('id');
            var r = /^\+?[1-9][0-9]*$/;
            if (r.test(id)) {
                if (id >= 1000) {
                    $('#' + id).hide();
                }
            }
            for (var i = 0; i < 10; i++) {
                var ad = $('#1');
                $(ad).addClass('asdsadkljjasdkl');
                $(ad).removeAttr('id');
                var ads = $('.asdsadkljjasdkl');
                if(ads.length === 0){
                    break;
                }
                $.each(ads, function (index, value) {
                    var ads = $(value).children('.f13').children('.m').length;
                    if (ads !== 0) {
                        $(value).remove();
                    } else {
                        $(value).removeClass('asdsadkljjasdkl');
                    }
                });
            }

        });
    }

    setInterval(function () {
        show();
    }, 20);
})();
