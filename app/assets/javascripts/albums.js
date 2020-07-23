$(function() {
  $("#albums-search").on("keyup", function() {
    let input = $("#albums-search").val();
    $.ajax({
      type: "GET",
      url: "/groups",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function(albums) {
        $(".albums-search__result").empty();
        if (albums.length !== 0) {
          albums.forEach(function(album) {
            addAlbum(album);
          }); 
        } else if (input.length == 0) {
          return false;
        } else {
          addNoAlbum();
        }
      })
      .fail(function() {
        alert("通信エラーです。アルバムが表示できません。")
      });
  });
});