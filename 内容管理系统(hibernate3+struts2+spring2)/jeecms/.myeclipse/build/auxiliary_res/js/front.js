Pn.ns('Auxi');
/* �ύ���� */
Auxi.saveMsg = function(base, callback) {
	base = base || '';
	$.postJson(base + '/jeecms/ajax/auxiliary/msgSave.do', {
		'ctg.id' : $('#msg_ctg_id').val(),
		'title' : $('#msg_title').val(),
		'content' : $('#msg_content').val(),
		'checkCode' : $('#msg_checkCode').val()
	}, function(data) {
		if (callback) {
			callback.apply(document, [data]);
		} else {
			alert(data.msg);
		}
		if (data.success) {
			location.reload();
		}
	});
}