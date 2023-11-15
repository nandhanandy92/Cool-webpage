.PHONY: init
init:
	@echo "Initiating.."
	cd ./Infrastructure && \
	tofu init
	@echo "✅ Done"

.PHONY: plan
plan:
	@echo "Initiating.."
	cd ./Infrastructure && \
	tofu plan
	@echo " ✅ Done"

.PHONY: deploy
deploy:
	@echo "Initiating.."
	cd ./Infrastructure && \
	tofu apply
	@echo " ✅ Done"

.PHONY: destroy
destroy:
	@echo "Initiating.."
	cd ./Infrastructure && \
	tofu destroy
	@echo " ✅ Done"