$(document).on('turbolinks:load', function() {

    //住所の変更ボタンクリックされたとき
    $('.btn_search00').click(function(){
        $('.search_addres').fadeIn();
    });

    $('.close-modal').click(function(){
        $('.search_addres').fadeOut();
    });

      //フラッシュ時間経過で消す
    setTimeout(function(){
        $('.flash').slideUp();
    },3000);

    //ヘッダーのトークルームボタン。モーダル開く
    $('#messeage_btn').click(function(){
        $('.talk').fadeIn();
    });
    //モーダル以外クリックで閉じる
    $(document).on('click',   function(e) {
        if (!$(e.target).closest('.talk,#messeage_btn').length) {
            $('.talk').hide();
        }
    });

    //ヘッダーのお知らせボタン。モーダル開く
    $('#bell_btn').click(function(){
        $('.bell').fadeIn();
    });
    //モーダル以外クリックで閉じる
    $(document).on('click',   function(e) {
        if (!$(e.target).closest('.bell,#bell_btn').length) {
            $('.bell').hide();
        }
    });

    $('.work-section').each(function () {

        var $container = $(this),// a
            $navItems = $container.find('.tabs-nav li')// b
            $highlight =$container.find('.tabs-highlight')// c
        // タブの各要素を jQuery オブジェクト化
        // a タブとパネルを含む全体のコンテナー
        // b タブのリスト
        // c 選択中タブのハイライト

        // jQuery UI Tabs を実行
        $container.tabs();
    });

    $('#tab a').click(function(){
        this.blur();
    });


    $('.work-section2').each(function () {

        var $container = $(this),// a
            $navItems = $container.find('.tabs-nav2 li')// b
            $highlight =$container.find('.tabs-highlight')// c
        // タブの各要素を jQuery オブジェクト化
        // a タブとパネルを含む全体のコンテナー
        // b タブのリスト
        // c 選択中タブのハイライト

        // jQuery UI Tabs を実行
        $container.tabs();
    });

    $('#tab a').click(function(){
        this.blur();
    });




});
