(function () {
    var scripts = [
        "https://embeds.iubenda.com/widgets/26dd57a1-9a0f-4513-8dd4-ec9e69bde091.js",
        "https://cdn.iubenda.com/iubenda.js"
    ];

    function loadScript(src) {
        if (document.querySelector('script[src="' + src + '"]')) {
            return;
        }

        var script = document.createElement("script");
        script.src = src;
        script.async = true;
        document.head.appendChild(script);
    }

    scripts.forEach(loadScript);
}());
