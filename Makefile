db:
	docker-compose -f docker/docker-compose.yml run nearform npx trail-database-init
	docker-compose -f docker/docker-compose.yml run nearform npx trail-database-migrate --version=max

load: 
	for i in $(shell seq 10000); do curl -H 'Content-Type: application/json' -X POST http://localhost:8080/graphql --data-binary '{"query": "mutation { insertTrail(when: \"2020-10-19T22:00:00+02:00\", who: {id: \"you\", foo: \"bar\" }, what:\"foo\", subject: \"bar\") { id } }"}'; done
