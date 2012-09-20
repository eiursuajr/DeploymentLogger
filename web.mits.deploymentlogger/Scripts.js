function StringIsEmail(testString)
{
    var RegEx = new RegExp('^\\w+([-+.\']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$');
    return RegEx.test(testString);
}

function StringIsDate(testString)
{
    var RegEx = new RegExp('^([1-9]|0[1-9]|1[012])/([1-9]|0[1-9]|[12][0-9]|3[01])/\\d\\d\\d\\d$');
    return RegEx.test(testString);
}

function StringIsEmpty(testString)
{
    var RegEx = /^\s+$/gm;
    testString = testString.replace(RegEx, '');
    return (testString.length == 0);
}

function ListValidate(elementId)
{
    var isValid = true;
    var elem = document.getElementById(elementId);
    if (elem)
        if(elem.value == "0")
            isValid = false;
    return isValid;
}

function EmailValidate(elementId, arguments)
{
    var isValid = true;
    var elem = document.getElementById(elementId);
    if (elem)
         isValid = StringIsEmail(elem.value);
    return isValid;
}

function DateValidate(elementId)
{
    var isValid = true;
    var elem = document.getElementById(elementId);
    if (elem)
        if (!StringIsEmpty(elem.value))
            isValid = StringIsDate(elem.value);
    return isValid;
}

function RequiredValidate(elementId, arguments)
{
    var isValid = true;
    var elem = document.getElementById(elementId);
    if (elem)
         isValid = !StringIsEmpty(elem.value);
    return isValid;
}

function PositionX(inputElement) 
{
    var offsetLeft = 0;
    if (inputElement.offsetParent)
    {
        while (inputElement.offsetParent)
        {
            offsetLeft += inputElement.offsetLeft;
            inputElement = inputElement.offsetParent;
        }
    }
    else if (inputElement.x)
    {
        offsetLeft += inputElement.x;
    }
    return offsetLeft;
}

function PositionY(inputElement) 
{
    var offsetTop = 0;
    if (inputElement.offsetParent)
    {
        while (inputElement.offsetParent)
        {
            offsetTop += inputElement.offsetTop;
            inputElement = inputElement.offsetParent;
        }
    }
    else if (inputElement.y)
    {
        offsetTop += inputElement.y;
    }
    return offsetTop;
}

function ToggleCalendar(e, inputId, calendarId)
{
    window.calendar = null;
    window.popup = null;
    window.calendarContainer = null;
    window.activeInput = null;
    window.isVisible = null;
    
    if (!window.calendar)
    {
        if (typeof(calendarId) != "undefined")
        {
            window.calendar = calendarId;
        }
        else return;
    }
    
    if (!window.popup)
        window.popup = new RadCalendar.Popup();
        
    if (!window.calendarContainer)
        window.calendarContainer = document.getElementById("calendarContainer");
        
    if (window.activeInput && window.activeInput.id == inputId && window.popup.IsVisible())
    {
	    window.popup.Hide();
    }			
    else
    {        
	    window.activeInput = document.getElementById(inputId);
	    var x = PositionX(window.activeInput);
	    var y = PositionY(window.activeInput) + window.activeInput.offsetHeight;
        
	    window.popup.Show(x, y, calendarContainer);
    }
    e.cancelBubble = true;
}

function ChangeInput(renderDay)
{
    var dateArray = renderDay.Date;  
    var dateString = dateArray[1] + "/" + dateArray[2] + "/" + dateArray[0];
    window.activeInput.value = dateString;
    
    if (window.popup.IsVisible())
	    window.popup.Hide();
}