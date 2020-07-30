$(function() {
  function addUser(user) {
    let html = `
      <div class="new-group-user">
        <div class="new-group-user__name">${user.name}</div>
        <div class="new-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
      </div>
    `;
    $("#user-search-result").append(html);
  }

  function addNoUser() {
    let html = `
      <div class="new-group-user">
        <p class="new-group-user__name">ユーザーが見つかりません</p>
      </div>
    `;
    $("#user-search-result").append(html);
  }

  function addDeleteUser(name, id) {
    let html = `
    <div class="new-group-user" id="${id}">
      <div class="new-group-user__name">${name}</div>
      <div class="new-group-user__btn--remove js-remove-btn" data-user-id="${id}" data-user-name="${name}">削除</div>
    </div>`;
    $(".js-add-user").append(html);
  }
  function addMember(userId) {
    let html = `<input value="${userId}" name="group[user_ids][]" type="hidden" id="group_user_ids_${userId}" />`;
    $(`#${userId}`).append(html);
  }

  $(document).on("keyup", "#user-search-field", function() {
    let input = $("#user-search-field").val();
    var group_id = $('.chat__group_id').val(); 
    $.ajax({
      type: "GET",
      url: "/groups",
      data: { keyword: input, groupId: group_id },
      dataType: "json"
    })
      .done(function(users){
        $("#user-search-result").empty();

        if (users.length !== 0) {
          users.forEach(function(user) {
            addUser(user);
          });
        } else if (input.length == 0) {
          return false;
        } else {
          addNoUser();
        }
      })
      .fail(function() {
        alert("通信エラーです。ユーザーが表示できません。");
      });
  });
  $(document).on("click", ".new-group-user__btn--add", function() {
    const userName = $(this).attr("data-user-name");
    const userId = $(this).attr("data-user-id");
    $(this)
      .parent()
      .remove();
    addDeleteUser(userName, userId);
    addMember(userId);
  });
  $(document).on("click", ".new-group-user__btn--remove", function() {
    $(this)
      .parent()
      .remove();
  });
});