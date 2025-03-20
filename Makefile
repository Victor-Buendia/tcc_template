GREEN = \033[92m
END = \033[0m

.PHONY: build
build:
	docker compose build latex
.PHONY: pdf
pdf:
	docker compose up
	mv ./latex/TCC_PDF.pdf ./
	make clean
	@echo "$(GREEN)PDF gerado com sucesso.$(END)"
	# osascript -e 'display notification "Your PDF was generated" with title "TCC"'
.PHONY: clean
clean:
	cd latex && make clean
hooks:
	chmod +x ./.githooks/pre-push.sh
	chmod +x ./.githooks/post-commit.sh
	ln -f ./.githooks/pre-push.sh .git/hooks/pre-push
	ln -f ./.githooks/post-commit.sh .git/hooks/post-commit