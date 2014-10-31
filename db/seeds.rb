# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Block.create(title: 'footer-left-ueber-uns', body: '<h2>Über unsss</h2><p>ist ein deutsches Unternehmen der Unternehmensgruppe OPC® mit Sitz in Trier. Geschäftsführer der OPC® cardsystems GmbH sind Herr Torsten Hülsmann, Kaufmann, und Herr Klaus-Dieter Schömer, Dipl.-Ing. (FH).</p>')

Block.create(title: 'home-page-qoute<br>who', body: 
  '<div class="service-box-heading"> <em><i class="fa fa-hand-o-right fa-lg blue"></i></em> <span>Wer Sind Wir?</span> </div>    <p>Wir helfen Ihnen gerne bei technischen Fragen rund um unsere Produkte. Uns liegt viel an Ihrem Erfolg, deshalb bieten wir Ihnen technische Unterstützung bei der Integration Ihrer Lösung an.</p>')
Block.create(title: 'home-page-qoute<br>what', 
  body: 
    '<div class="service-box-heading">
      <em><i class="fa fa-compress  red"></i></em>
      <span>Was Machen Wir?</span>
    </div>
    <p>Mittels Fernwartungssoftware bietet sich die Möglichkeit, dass sich unsere Supportmitarbeiter direkt auf Ihren Server oder Ihre Systeme (z. B. Kassenplatz, Point-Of- Sale) aufschalten können.</p>')

Block.create(title: 'home-page-qoute<br>why', 
  body:     
    '<div class="service-box-heading">
      <em><i class="fa fa-check green"></i></em>
      <span>Warum Sie Wahlen Wir?</span>
    </div>
    <p>Das Problem lässt sich nicht an der Hotline oder über unseren Remoteservice lösen? Dann nutzen Sie unseren vor Ort Service. Qualifizierte Supportmitarbeiter unterstützen Sie deutschlandweit und wir garantieren für eine schnelle Problemlösung.</p>')

Block.create(title: 'home-page-topbar-tel', body: '+49 (0) 651-8408-0' )
Block.create(title: 'home-page-topbar-email', 
  body:
    '<a href="mailto:someone@example.com?Subject=contact%20from%20website" target="_top">
      <i class="fa fa-envelope-o"></i>
      info@opc.de
    </a>')


losungen = Page.create(title: "Lösungen", parent_id: 1)

Page.create(title: "Disco, Club & Events", parent_id: losungen.id)
Page.create(title: "Schulverpflegung & Kitas", parent_id: losungen.id)
Page.create(title: "Betriebsrestauration & Mensa", parent_id: losungen.id)
Page.create(title: "Kliniken & Reha", parent_id: losungen.id)
Page.create(title: "Gastronomie & Restaurant", parent_id: losungen.id)
Page.create(title: "Tourismus & Hotellerie", parent_id: losungen.id)
Page.create(title: "Freizeitcenter & Bowlingcenter", parent_id: losungen.id)
Page.create(title: "Stadien & Arenen", parent_id: losungen.id)