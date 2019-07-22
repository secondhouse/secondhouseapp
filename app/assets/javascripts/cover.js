$(document).on('turbolinks:load', function() {


    $('.wrapp_cover').on('click','.cover_add5', function(){
        $('.cover_modal').fadeIn();
    });
    //モーダル以外クリックで閉じる
    $(document).on('click', function(e) {
        if (!$(e.target).closest('.cover_modal,.cover_add5').length){
            $('.cover_modal').hide();
        }
    });

    $('#modalCancel').on('click', function(){
        $('.cover_modal').hide();
    });

    $('.wrapp_cover').on('change', 'input[type="file"]', function(){
        $('#trimming, #preview').fadeIn();
    });

    $('#times_trimming, #trimming_cancel').on('click', function(){
        $('#trimming, #preview').fadeOut();
    });





//(モーダルに画像反映)画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
     $('.wrapp_cover').on('change', 'input[type="file"]', function(e) {
       var file = e.target.files[0],
           reader = new FileReader(),
           $preview = $(".trimming_main"),
           $cover = $('.show_wrapp_cover5'),
           coverClone = $('.show_wrapp_cover5').contents(),
           t = this;

       // 画像ファイル以外の場合は何もしない
       if(file.type.indexOf("image") < 0){
         return false;
       }

       // ファイル読み込みが完了した際のイベント登録
       reader.onload = (function(file) {
         return function(e) {
           //既存のプレビューを削除
           $preview.empty();
           $cover.empty();
           $cover.html('<div></div>');
           // .prevewの領域の中にロードした画像を表示するimageタグを追加

           $preview.append($('<img>').attr({
                     src: e.target.result,
                     width: "100%",
                     class: "preview_image",
                     id: "clopImg0",
                     title: file.name
                 }));
            $cover.append($('<img>').attr({
                src: e.target.result,
                width: "100%",
                class: "preview_image",
                id: "clopImg",
                title: file.name
            }));
            //coverには反映されるがpreviewには反映されない
            //$('.preview_image').attr('src', '/French_bulldog.jpg');


         };
       })(file);
       reader.readAsDataURL(file);

       $('#times_trimming, #trimming_cancel').on('click', function(){
           $cover.html(coverClone);
       });
       cropStart();
     });


     //テスト(cropper)

     function cropStart(){
         var $image = $("#clopImg");
         $image.cropper({
             dragMode:"move",
             aspectRatio:4/5,
             wheelZoomRatio:0.05,
             modal:false,
             autoCropArea:1,
             cropBoxMovable:false,
             cropBoxResizable:false,
             dragCrop:false,
             toggleDragModeOnDblclick:false,
             aspectRatio: 16 / 9,
             crop: function(event) {
                console.log(event.detail.x);
                console.log(event.detail.y);
                console.log(event.detail.width);
                console.log(event.detail.height);
                console.log(event.detail.rotate);
                console.log(event.detail.scaleX);
                console.log(event.detail.scaleY);
            },
             built:function(){
                 $("#clopImg").cropper(
                     "setCropBoxData",{left:192,top:77.5,width:116,height:145}
                 );
             }
         });
         var cropper = $image.data('cropper');
     }
     cropStart();


});
