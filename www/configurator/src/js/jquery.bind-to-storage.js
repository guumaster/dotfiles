(function(jQuery) {
    function convertType(type, oldVal){
        switch(type) {
            case 'json':
                try{
                    oldVal = JSON.parse(oldVal) || undefined;
                } catch(err) {
                    oldVal = undefined;
                }
                break;
            case 'number':
                oldVal = parseInt(oldVal, 10);
                break;
            case 'bool':
                oldVal = oldVal === 'true' ? true: oldVal === 'false' ? false: undefined;
                break;
        }
        return oldVal;

    }

    function setValue(el, type, val) {
        var el_type = el.attr('type');
        switch(el_type){
            case 'checkbox':
                el[(val?'attr':'removeAttr')]('checked', true);
                break;
            case 'radio':
                if( val && el.data('storage-val') && val.toString() === el.data('storage-val').toString() ) {
                    el.attr('checked', true);
                } else {
                    el.removeAttr('checked');
                }
                break;
        }

    }

    function triggerStorage(e) {
        var t, data, key, oldVal, newVal;
        t = $(e.target);
        if(!t.attr('type') ) { return; }
        data = t.data();
        key = data.storageKey;
        if( key ) {
            oldVal = localStorage.getItem(key);
            oldVal = convertType(data.storageType, oldVal);

            if( data.storageType === 'bool' ) {
                newVal = oldVal ? false : true;
                localStorage.setItem(key, newVal);
            }

            if( data.storageVal ) {
                localStorage.setItem(key, data.storageVal);
                newVal = data.storageVal;
            }
            jQuery.event.trigger({ type: key+'.change'},{key:key, newVal:newVal, oldVal: oldVal});
            e.stopPropagation();
            return false;
        }

    }

    jQuery.fn.bindToStorage = function() {
        jQuery('[data-storage-key]').each(function(i,v){
            var el = $(v);
            var data = $(this).data();
            var key = data.storageKey;
            var val = convertType(data.storageType, localStorage.getItem(key));
            setValue(el, data.storageType, val);
        });
        return $('[data-storage-key]').on('change', triggerStorage);
    };

}(jQuery));
