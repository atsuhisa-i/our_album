// $(function() {
//   function addAlbum(album) {
//     let html = `
//     <a class="album-content" href="/groups/${album.group_id}/albums/${album.id}"><div class="album__picture">
//       <div class="album__picture">
//         <img src=${album.picture} width="220" height="150">
//       </div>
//       <div class="album__title">
//         タイトル：${album.title}
//       </div>
//       <div class="album__date">
//         日付：${album.date}
//       </div>
//     </a>
//     `;
//     $(".albums-search__result").append(html);
//   }

//   function addNoAlbum() {
//     let html = `
//       <div class="no-album">
//         <p class="no-album__content">アルバムが見つかりません</p>
//       </div>
//     `;
//     $(".albums-search__result").append(html);
//   }

//   $(".albums-search").on("keyup", function() {
//     let input = $(".albums-search").val();
//     $.ajax({
//       type: "GET",
//       url: "/groups",
//       data: { keyword: input },
//       dataType: "json"
//     })
//       .done(function(albums) {
//         $(".display__albums-inner").empty();
//         if (albums.length !== 0) {
//           albums.forEach(function(album) {
//             addAlbum(album);
//           }); 
//         } else if (input.length == 0) {
//           return false;
//         } else {
//           addNoAlbum();
//         }
//       })
//       .fail(function() {
//         alert("通信エラーです。アルバムが表示できません。")
//       });
//   });
// })