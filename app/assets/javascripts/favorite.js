function showTeams () {
    var id = event.currentTarget.id;
    $(`.${id}`).toggle();
  };

function addTeam() {
  event.preventDefault();
  var path = window.location.pathname;
  var teamId = event.currentTarget.id
  var request = $.ajax({
      url: `${path}/favorites.json`,
      method: 'POST',
      data: { team_id: teamId },
      error: function() {
        alert('NOPE!');
      }
    });

  request.done(function(data) {
      var newTeam = data;
      var teamName = `${newTeam['name']} ${newTeam['nickname']}`;
      var item = document.createElement('li');
      item.innerHTML = teamName;
      document.getElementById('favorites').appendChild(item);
  });
};

function showEvents () {
    var id = event.currentTarget.id;
    debugger;
    $(`.${id}`).toggle();
    }
  };
