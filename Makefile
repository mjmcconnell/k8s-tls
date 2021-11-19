backend.build:
	docker build -t backend:local -f docker/Dockerfile.backend .

backend.push: backend.build
	docker tag backend:local ghcr.io/mjmcconnell/k8s-tls/backend:latest
	docker push ghcr.io/mjmcconnell/k8s-tls/backend:latest

backend.run: backend.build
	docker run --rm -it -p 8001:8000 -e PORT="8000" backend:local

frontend.build:
	docker build -t frontend:local -f docker/Dockerfile.frontend .

frontend.push: frontend.build
	docker tag frontend:local ghcr.io/mjmcconnell/k8s-tls/frontend:latest
	docker push ghcr.io/mjmcconnell/k8s-tls/frontend:latest

frontend.run: frontend.build
	docker run --rm -it -p 8000:8000 -e PORT="8000" frontend:local
