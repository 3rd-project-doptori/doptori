$(function(){  

    var article = (".recruit .show");  

    $(".recruit .item  td").click(function() {  

        var myArticle =$(this).parents().next("tr");  

        if($(myArticle).hasClass('hide')) {  

            $(article).removeClass('show').addClass('hide');  

            $(myArticle).removeClass('hide').addClass('show');  

        }  

        else {  

            $(myArticle).addClass('hide').removeClass('show');  

        }  

    });  

});  
