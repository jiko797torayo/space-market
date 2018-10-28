$(document).on("turbolinks:load", function() {
  $('#space_image_image_files_attributes_0_file').on('change', function (e) {
    //プレビュー
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview0").empty();
      $("#preview0").attr('src', e.target.result);
    };
    reader.readAsDataURL(e.target.files[0]);
    //カードを表示
    $('#photocard0').removeClass('hidden');
    //次の追加ボタンを表示
    $('#add1').removeClass('hidden');
  });
});

$(document).on("turbolinks:load", function() {
  $('#space_image_image_files_attributes_1_file').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview1").empty();
      $("#preview1").attr('src', e.target.result);
    };
    reader.readAsDataURL(e.target.files[0]);
    $('#photocard1').removeClass('hidden');
    $('#add2').removeClass('hidden');
  });
});

$(document).on("turbolinks:load", function() {
  $('#space_image_image_files_attributes_2_file').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview2").empty();
      $("#preview2").attr('src', e.target.result);
    };
    reader.readAsDataURL(e.target.files[0]);
    $('#photocard2').removeClass('hidden');
    $('#add3').removeClass('hidden');
  });
});

$(document).on("turbolinks:load", function() {
  $('#space_image_image_files_attributes_3_file').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview3").empty();
      $("#preview3").attr('src', e.target.result);
    };
    reader.readAsDataURL(e.target.files[0]);
    $('#photocard3').removeClass('hidden');
    $('#add4').removeClass('hidden');
  });
});

$(document).on("turbolinks:load", function() {
  $('#space_image_image_files_attributes_4_file').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview4").empty();
      $("#preview4").attr('src', e.target.result);
    };
    reader.readAsDataURL(e.target.files[0]);
    $('#photocard4').removeClass('hidden');
    $('#add5').removeClass('hidden');
  });
});
