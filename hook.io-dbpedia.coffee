# Imports
Hook = require('hook.io-sparql').SPARQLHook


hook = new Hook({ 'url': 'http://dbpedia.org/sparql'})

hook.addPreffix 'dbprop','http://dbpedia.org/property/'
hook.addPreffix 'dbpedia','http://dbpedia.org/resource/'
hook.addPreffix 'rdf','http://www.w3.org/1999/02/22-rdf-syntax-ns#' 
hook.addPreffix 'dbpedia-owl' , 'http://dbpedia.org/ontology/'


hook.on 'hook::ready', ->
    hook.on '*::query', (data,fn) ->
        hook.query data , (res) ->
            console.log res
            fn res
    console.log "Created"


hook.start()
