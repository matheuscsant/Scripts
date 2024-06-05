@echo off

title ATUALIZAR REPOSITORIOS

cd ..

for /d %%d in (*) do (
	cd %%d
	if exist .git (
		echo ### [UPDATING...] Atualizando projeto %%d
		echo.
		git pull
		echo.
		echo ### [UPDATED] Projeto %%d atualizado
		echo.
	) else (
		echo.
		echo ### [IGNORING...] Ignorando pasta %%d
		echo.
	)
	cd ..
)
echo ### [FINALIZED] Atualizacao finalizada
pause