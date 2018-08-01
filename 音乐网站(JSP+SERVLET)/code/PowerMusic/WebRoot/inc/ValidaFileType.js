	Validator = {
	Filter : "this.DoFilter(value, getAttribute('accept'))",
	ErrorItem : [document.forms[0]],
	ErrorMessage : [""],
	Validate : function(theForm){
		var obj = theForm || event.srcElement;
		var count = obj.elements.length;
		this.ErrorMessage.length = 1;
		this.ErrorItem.length = 1;
		this.ErrorItem[0] = obj;
		for(var i=0;i<count;i++){
			with(obj.elements[i]){
				var _dataType = getAttribute("dataType");
				if(typeof(_dataType) == "object" || typeof(this[_dataType]) == "undefined")  continue;
				this.ClearState(obj.elements[i]);
				switch(_dataType){
					case "Filter" :
						if(!eval(this[_dataType]))	{
							this.AddError(i, getAttribute("msg"));
						}
						break;
				}
			}
		}
		if(this.ErrorMessage.length > 1){
			var errCount = this.ErrorItem.length;
			alert(this.ErrorMessage.join(""));
				this.ErrorItem[1].focus();
			return false;
		}
		return true;
	},
	ClearState : function(elem){
		with(elem){
			if(style.color == "red")
				style.color = "";
			var lastNode = parentNode.childNodes[parentNode.childNodes.length-1];
			if(lastNode.id == "__ErrorMessagePanel")
				parentNode.removeChild(lastNode);
		}
	},
	AddError : function(index, str){
		this.ErrorItem[this.ErrorItem.length] = this.ErrorItem[0].elements[index];
		this.ErrorMessage[this.ErrorMessage.length] = str;
	},

	DoFilter : function(input, filter){
return new RegExp("^.+\.(?=EXT)(EXT)$".replace(/EXT/g, filter.split(/\s*,\s*/).join("|")), "gi").test(input);
	}
	
 }