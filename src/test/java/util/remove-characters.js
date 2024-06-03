function(string, charsToRemove) {
        var regex = new RegExp('[' + charsToRemove.split('').join('') + ']', 'g');
        return string.replace(regex, '');
        }