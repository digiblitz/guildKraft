//
//Copyright: 2018 digiBlitz Foundation
//
//License: digiBlitz Public License 1.0 (DPL) 
//Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
//
//Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
//
//Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
//
//"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
//
(function () {
    var popup = function() {
        function hide(dom, dosomething) {
            if (!dom) {
                console.error('hide function not set dom object');
                return;
            }
            if (dosomething) {
                dosomething();
            }
            dom.className += ' ' + 'popup_hide';
        }
        function show(dom, dosomethingShow, dosomethingClose) {
            if (!dom) {
                console.error('show function not set dom object');
                return;
            }
            if (dosomethingShow) {
                dosomethingShow();
            }
            var className = 'popup_hide',
                reg = new RegExp('(^|\\b)' +
                    className.split(' ').join('|') +
                    '(\\b|$)', 'gi');
            dom.className = dom.className.replace(reg, '').trim();
            var nodes = dom.childNodes;
            for (var i = nodes.length - 1; i >= 0; i--) {
                if (nodes[i].className === 'pop_up_close') {
                    var close = function (e) {
                        if (dosomethingClose) {
                            dosomethingClose();
                        }
                        dom.className += ' ' + 'popup_hide';
                        nodes[i].removeEventListener('click', close);
                    };
                    nodes[i].addEventListener('click', close);
                    break;
                }
            }
        }
        this.show = show;
        this.hide = hide;
    };
    window.popup = popup;
})();
