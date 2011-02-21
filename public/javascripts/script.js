$(function() {
    $("#center h1").draggable();
    $(".sprite").draggable();

    $("#recortable-chicachico").droppable({
        accept: ".recortable",
        activeClass: "hover",
        hoverClass: "active",
        drop: function(event, ui) {
            document.location = '/chicachico.html'
        }
    });

    var width = $(window).width();
    var height = $(window).height();
    $(".resources img").hide().appendTo(".playground").load(function() {
        $(this).addClass('sprite')
        $(this).css('left', Math.random() * (width - $(this).width())).css('top', Math.random() * (height - $(this).height()));
        $(this).fadeIn(10000);
    });
    $("#pajaro3").hover(function() {
    }, function() {
    });
});