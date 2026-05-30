# Audit e roadmap portfolio Cuong Tomba

## Audit prioritario

- SEO: prima mancavano description dedicate, canonical, hreflang, Open Graph robusti, JSON-LD, sitemap e image sitemap. Gli alt erano generici come "Photograph 01", poco utili per fotografia automotive/sportiva.
- Gerarchia visuale: home, overview e gallery non avevano un H1 semantico. La base minimal era buona, ma la tipografia e i dettagli interattivi sembravano piu' generici che editoriali.
- UX mobile: header e menu funzionavano visivamente ma il controllo menu era poco accessibile da tastiera; la pagina info era lunga, duplicata e dominata dal form esterno.
- Core Web Vitals: Google Fonts, Iubenda globale e Google Form caricati in ingresso aumentavano richieste terze. Le immagini erano JPEG pesanti, alcune oltre 8-10 MB, senza lazy loading, dimensioni esplicite o fetch priority.
- Accessibility: mancavano focus state chiari, alt strategici, rel sicuri sui link esterni, iframe title e gerarchia heading coerente.
- Privacy/GDPR: Iubenda veniva caricato su tutte le pagine e il form Google era incorporato nella pagina contatti. Ora gli embed sono concentrati nella privacy page e non ci sono banner all'ingresso.

## SEO fotografico implementato

- Title e meta description specifici per ogni pagina.
- Canonical, hreflang IT/EN e x-default.
- Open Graph e Twitter Card con immagine di portfolio.
- JSON-LD Person + WebPage/CollectionPage.
- H1 semantici anche dove non devono alterare il layout.
- Alt text orientati a automotive, motorsport, sport, eventi, travel e progetti personali.
- robots.txt, sitemap.xml e image-sitemap.xml.

## Performance implementata

- Rimossi Google Fonts e loader Iubenda globale.
- Rimosso iframe Google dalla pagina info; resta solo nella privacy page.
- Hero image in preload + fetchpriority high.
- Lazy loading, decoding async, width/height e sizes sulle immagini gallery.
- Gallery card convertite da background-image a immagini reali indicizzabili.
- CSS senza dipendenze e con reduced motion.

## Da fare per 95+ Performance stabile

1. Eseguire tools/convert-images.ps1 con ImageMagick installato.
2. Aggiungere tag picture AVIF/WebP per hero, covers e foto gallery, mantenendo JPEG fallback.
3. Creare varianti 640/960/1440/1920px per srcset invece di servire sempre il file pieno.
4. Comprimere in particolare photos/galleries/travel/photo-10.jpg e photo-12.jpg, oggi molto pesanti.
5. Lanciare Lighthouse su GitHub Pages dopo deploy, non solo da file locale.

## Checklist Lighthouse finale

- Performance: target 90-95 subito dopo lazy loading e rimozione terzi; 95+ dopo AVIF/WebP e srcset reali.
- SEO: target 100 con sitemap pubblicate e canonical corretti.
- Accessibility: target 95+ con focus, heading, alt e iframe title.
- Best Practices: target 95+ con rel noopener, HTTPS e niente script terzi non necessari.

## Struttura consigliata

- /assets: copertine, icone, immagini about.
- /photos: archivio fotografico ottimizzato.
- /galleries: pagine di categoria.
- /tools: script di ottimizzazione immagini.
- /sitemap.xml e /image-sitemap.xml: pubblicati nella root.

## Stima miglioramento score

- SEO: 70-80 -> 100.
- Accessibility: 75-85 -> 95+.
- Performance: 55-75 -> 85-92 con le modifiche attuali; 95+ dopo conversione AVIF/WebP e srcset responsive.
- UX percepita: piu' pulita, premium e meno invasiva grazie alla rimozione degli embed in ingresso.
