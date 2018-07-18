/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var room = 1;var check=1;var h;var f;
function fields() {
   
    h=room;
    while(h>0){
      var id="Medicinename"+h;
      var f = document.getElementById(id);
      if(f.checkValidity())
        h--;
      else
      {
        alert("Enter Medicine Name");
        returnFalse();
      }
    }
    room++;
    var objTo = document.getElementById('medicine');
    var divtest = document.createElement("div");
  divtest.setAttribute("class", "form-group removeclass"+room);
  var rdiv = 'removeclass'+room;
    divtest.innerHTML = '<div class="col-sm-3 nopadding"><div class="form-group"> <input type="text" class="form-control" id="Medicinename'+room+'" name="Medicinename'+room+'"  placeholder="Medicine name" required="required"></div></div><div class="col-sm-3 nopadding"><div class="form-group"> <input type="number" class="form-control" id="dose'+room+'" name="dose'+room+'"  placeholder="Dosage(in mg)" required="required"></div></div><div class="col-sm-3 nopadding"><div class="form-group"> <input type="number" min=1 class="form-control" id="Days'+room+'" name="Days'+room+'"  value="" placeholder="Days" required="required"></div></div><div class="col-sm-3 nopadding"><div class="form-group"> <div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_fields('+ room +');"> <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> </button></div></div></div><div class="clear"></div>';
    
    objTo.appendChild(divtest);
  
  
}
   function remove_fields(rid) {
     $('.removeclass'+rid).remove();
     room--;
   }

  function alo()
  {
      h=room;
      while(h>0){
      var id="Medicinename"+h;
      var f = document.getElementById(id);
      if(f.checkValidity())
        h--;
      else
      {
        alert("Enter Medicine Name");
        returnFalse();
      }
    }
    var no_field=document.getElementById('no_field');
    no_field.value=room;
    alert(no_field.value);
  }

  function rlo()
  {
    while(room>1){
     remove_fields(room);
    }
    
  }