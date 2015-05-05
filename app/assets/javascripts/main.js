// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
	var x = document.getElementById("errormessage");
	var latitude, longitude;
	var city;
	var cache;
	var currentbusiness;
	var jsonType; // 0 = yelp, 1 = mine

	/*$(document).ready(function(){
		if(longitude == null && latitude == null || city == null){
			getLocation();
		}
	});

	function getLocation() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(storePosition, showError);
	    } else { 
	        x.innerHTML = "Geolocation is not supported by this browser.";
	       	$("#location").removeClass("hide");
	    }
	}

	function storePosition(position) {
		if(position == null){
	    	$("#location").removeClass("hide");
		}
		else{
		    latitude = position.coords.latitude; 
		    longitude = position.coords.longitude;	
		}
	}

	function showError(error) {
		alert("nope");
	    switch(error.code) {
	        case error.PERMISSION_DENIED:
	            x.innerHTML = "User denied the request for Geolocation."
	            break;
	        case error.POSITION_UNAVAILABLE:
	            x.innerHTML = "Location information is unavailable."
	            break;
	        case error.TIMEOUT:
	            x.innerHTML = "The request to get user location timed out."
	            break;
	        case error.UNKNOWN_ERROR:
	            x.innerHTML = "An unknown error occurred."
	            break;
	    }
	    $("#location").removeClass("hide");
	}*/
  $(document).on('click', '#citybutton', function(){
    city = $("#cityvalue").val();
    $("#cityvalue").val("");
    $("#location").fadeOut(500, function() { 
          $('#location').addClass('hide');
      });
      search(0);
      jsonType = 0;
  });

  $(document).on('click', '#pickagainbutton', function(){
    pick();
  });

	$("#pickchoice").on('change', function(){
    fillCache();
	});

	$(document).on('click', '#addtolistbutton', function(){
	  var selected = $("#addchoice option:selected" ).text();
    var address = String(currentbusiness['location']['display_address']);

  	$.post('/addrestaurant', { name: currentbusiness['name'], link: currentbusiness['url'], yelp_id: currentbusiness['id'], image_url: currentbusiness['image_url'], address: address, rating_img_url: currentbusiness['rating_img_url'], review_count: currentbusiness['review_count'], listname: selected}, function(data) {
  		alert(currentbusiness['name'] + " has been added to " + selected + "!");
  	})
    .fail(function() {
    	alert( "Error! :(" );
    });
	});

  function fillCache(){
    var selected = $("#pickchoice option:selected" ).text();
    if(selected == "All results"){
      jsonType = 0;
      search(0);
    }
    else{
      alert("me");
      $.get('/picklist', { name: selected }, function(data) {
        cache = [];
        cache = data['restaurants'];
        console.log(JSON.stringify(cache));
        jsonType = 1;
        pick();
      })
      .fail(function() {
        alert( "Error! :(" );
      });
    }
  };

	function pick(){
    if(cache.length === 0){
      fillCache();
    }
    else{
      var random = Math.floor(Math.random() * cache.length);
      currentbusiness = cache[random];
      $("#pickspace").empty();
      $("#pickspace").prepend(showPick(currentbusiness));
      cache.splice(random, 1);
      console.log(cache.length);
    }
	};

	function search(offset) {
		$.post('/search', { city: city, offset: offset }, function(data) {
      cache = [];
			cache = data['businesses'];
      if(cache.length === 0){
        alert( "No results :(" );
        $("#location").fadeIn(500, function() { 
              $('#location').removeClass('hide');
          });
      }
      else{
        pick();
        $("#pickagainbox").removeClass("hide");
        $("#listchoicebox").removeClass("hide");
      }
		})
    .fail(function() {
    	alert( "Invalid city :(" );
      $("#location").fadeIn(500, function() { 
            $('#location').removeClass('hide');
        });
    });
	};

	function showPick(business) {
	  if(jsonType == 0){
      return [
        '<div class="pickresult">',
          '<img class="biz_img" src="', business['image_url'], '">',
          '<p class="biz_name"><a href="', business['url'] ,'" target="_blank">', business['name'], '</a></p>',
          '<p class="address">',business['location']['display_address'],'</p>',
          '<img class="ratingpic" src="', business['rating_img_url'], '">',
          '<p>', business['review_count'], ' reviews</p>',
        '</div>'
      ].join('');
    }
    else{
      return [
        '<div class="pickresult">',
          '<img class="biz_img" src="', business['image_url'], '">',
          '<p class="biz_name"><a href="', business['link'] ,'" target="_blank">', business['name'], '</a></p>',
          '<p class="address">', business['address'],'</p>',
          '<img class="ratingpic" src="', business['rating_img_url'], '">',
          '<p>', business['review_count'], ' reviews</p>',
        '</div>'
      ].join('');
    }
	};
});
