var request = require('request'),
    json    = require('json'),
    log     = function(a) { console.log(a) }

var USERNAME = process.argv[2];

if (! USERNAME) {
	log('specify a username');
	process.exit(1);
}

var endpoint = function(u) { 
	return 'https://api.github.com/users/' + USERNAME + '/starred?sort=updated&direction=desc&page='
}

function getPageOfRepos(n) {
	var options = {
		method: 'GET', uri: endpoint(USERNAME) + n,
		headers: {
			"user-agent": "node.js"	
		}
	}

	request(options, function (error, response, body) {
		if (error) throw error;

		var repos = JSON.parse( body )

		var asOneLine = function(a) {
			return a.full_name + ' ' + a.clone_url
		}

		if (repos.length) {
			repos.map( asOneLine ).forEach( log )
			getPageOfRepos( ++n )
		}
	})
}

getPageOfRepos(1)