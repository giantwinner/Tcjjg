 function QueryString(fieldName) {
            var urlString = document.location.search;
            if (urlString != null) {
                var typeQu = fieldName + "=";
                var urlEnd = urlString.indexOf(typeQu);
                if (urlEnd != -1) {
                    var paramsUrl = urlString.substring(urlEnd + typeQu.length);
                    var isEnd = paramsUrl.indexOf('&');
                    if (isEnd != -1) {
                        return paramsUrl.substring(0, isEnd);
                    }
                    else {
                        return paramsUrl;
                    }
                }
                else {
                    return null;
                }
            }
            else {
                return null;
            }
        }