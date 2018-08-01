// added by itraveler
function sayNavigate(url)
{
  var oBaseColl = document.all.tags('BASE');
  if (oBaseColl && oBaseColl.length && oBaseColl[0].target.length)
    window.open(url, oBaseColl[0].target);
  else
    document.location.assign(url);
  if (event)
    event.returnValue = false;
}