@echo off
chcp 65001 >nul
echo Criando repositórios e controllers...

:: Definir diretório base
set BASE_DIR=src\main\java\com\controleestoque\api_estoque

:: Criar diretórios
mkdir "%BASE_DIR%\repository" 2>nul
mkdir "%BASE_DIR%\controller" 2>nul

:: ========== REPOSITÓRIOS ==========

echo Criando CategoriaRepository...
type nul > "%BASE_DIR%\repository\CategoriaRepository.java"
(
echo package com.controleestoque.api_estoque.repository;
echo.
echo import org.springframework.data.jpa.repository.JpaRepository;
echo import com.controleestoque.api_estoque.model.Categoria;
echo.
echo public interface CategoriaRepository extends JpaRepository^<Categoria, Long^> {
echo }
) > "%BASE_DIR%\repository\CategoriaRepository.java"

echo Criando FornecedorRepository...
type nul > "%BASE_DIR%\repository\FornecedorRepository.java"
(
echo package com.controleestoque.api_estoque.repository;
echo.
echo import org.springframework.data.jpa.repository.JpaRepository;
echo import com.controleestoque.api_estoque.model.Fornecedor;
echo.
echo public interface FornecedorRepository extends JpaRepository^<Fornecedor, Long^> {
echo }
) > "%BASE_DIR%\repository\FornecedorRepository.java"

echo Criando ProdutoRepository...
type nul > "%BASE_DIR%\repository\ProdutoRepository.java"
(
echo package com.controleestoque.api_estoque.repository;
echo.
echo import org.springframework.data.jpa.repository.JpaRepository;
echo import com.controleestoque.api_estoque.model.Produto;
echo.
echo public interface ProdutoRepository extends JpaRepository^<Produto, Long^> {
echo }
) > "%BASE_DIR%\repository\ProdutoRepository.java"

echo Criando EstoqueRepository...
type nul > "%BASE_DIR%\repository\EstoqueRepository.java"
(
echo package com.controleestoque.api_estoque.repository;
echo.
echo import org.springframework.data.jpa.repository.JpaRepository;
echo import com.controleestoque.api_estoque.model.Estoque;
echo.
echo public interface EstoqueRepository extends JpaRepository^<Estoque, Long^> {
echo }
) > "%BASE_DIR%\repository\EstoqueRepository.java"

:: ========== CONTROLLERS ==========

echo Criando CategoriaController...
type nul > "%BASE_DIR%\controller\CategoriaController.java"
(
echo package com.controleestoque.api_estoque.controller;
echo.
echo import com.controleestoque.api_estoque.model.Categoria;
echo import com.controleestoque.api_estoque.repository.CategoriaRepository;
echo import lombok.RequiredArgsConstructor;
echo import org.springframework.http.HttpStatus;
echo import org.springframework.http.ResponseEntity;
echo import org.springframework.web.bind.annotation.*;
echo.
echo import java.util.List;
echo.
echo @RestController
echo @RequestMapping^("/api/categorias"^)
echo @RequiredArgsConstructor
echo public class CategoriaController {
echo.
echo     private final CategoriaRepository categoriaRepository;
echo.
echo     @GetMapping
echo     public List^<Categoria^> getAllCategorias^(^) {
echo         return categoriaRepository.findAll^(^);
echo     }
echo.
echo     @GetMapping^("/{id}"^)
echo     public ResponseEntity^<Categoria^> getCategoriaById^(@PathVariable Long id^) {
echo         return categoriaRepository.findById^(id^)
echo                 .map^(ResponseEntity::ok^)
echo                 .orElse^(ResponseEntity.notFound^(^.build^(^)^);
echo     }
echo.
echo     @PostMapping
echo     @ResponseStatus^(HttpStatus.CREATED^)
echo     public Categoria createCategoria^(@RequestBody Categoria categoria^) {
echo         return categoriaRepository.save^(categoria^);
echo     }
echo.
echo     @PutMapping^("/{id}"^)
echo     public ResponseEntity^<Categoria^> updateCategoria^(@PathVariable Long id, @RequestBody Categoria categoriaDetails^) {
echo         return categoriaRepository.findById^(id^)
echo                 .map^(categoria -^> {
echo                     categoria.setNome^(categoriaDetails.getNome^(^)^);
echo                     Categoria updatedCategoria = categoriaRepository.save^(categoria^);
echo                     return ResponseEntity.ok^(updatedCategoria^);
echo                 }^)
echo                 .orElse^(ResponseEntity.notFound^(^.build^(^)^);
echo     }
echo.
echo     @DeleteMapping^("/{id}"^)
echo     public ResponseEntity^<Void^> deleteCategoria^(@PathVariable Long id^) {
echo         if ^(!categoriaRepository.existsById^(id^)^) {
echo             return ResponseEntity.notFound^(^.build^(^);
echo         }
echo         categoriaRepository.deleteById^(id^);
echo         return ResponseEntity.noContent^(^.build^(^);
echo     }
echo }
) > "%BASE_DIR%\controller\CategoriaController.java"

echo Criando FornecedorController...
type nul > "%BASE_DIR%\controller\FornecedorController.java"
(
echo package com.controleestoque.api_estoque.controller;
echo.
echo import com.controleestoque.api_estoque.model.Fornecedor;
echo import com.controleestoque.api_estoque.repository.FornecedorRepository;
echo import lombok.RequiredArgsConstructor;
echo import org.springframework.http.HttpStatus;
echo import org.springframework.http.ResponseEntity;
echo import org.springframework.web.bind.annotation.*;
echo.
echo import java.util.List;
echo.
echo @RestController
echo @RequestMapping^("/api/fornecedores"^)
echo @RequiredArgsConstructor
echo public class FornecedorController {
echo.
echo     private final FornecedorRepository fornecedorRepository;
echo.
echo     @GetMapping
echo     public List^<Fornecedor^> getAllFornecedores^(^) {
echo         return fornecedorRepository.findAll^(^);
echo     }
echo.
echo     @GetMapping^("/{id}"^)
echo     public ResponseEntity^<Fornecedor^> getFornecedorById^(@PathVariable Long id^) {
echo         return fornecedorRepository.findById^(id^)
echo                 .map^(ResponseEntity::ok^)
echo                 .orElse^(ResponseEntity.notFound^(^.build^(^)^);
echo     }
echo.
echo     @PostMapping
echo     @ResponseStatus^(HttpStatus.CREATED^)
echo     public Fornecedor createFornecedor^(@RequestBody Fornecedor fornecedor^) {
echo         return fornecedorRepository.save^(fornecedor^);
echo     }
echo.
echo     @PutMapping^("/{id}"^)
echo     public ResponseEntity^<Fornecedor^> updateFornecedor^(@PathVariable Long id, @RequestBody Fornecedor fornecedorDetails^) {
echo         return fornecedorRepository.findById^(id^)
echo                 .map^(fornecedor -^> {
echo                     fornecedor.setNome^(fornecedorDetails.getNome^(^)^);
echo                     Fornecedor updatedFornecedor = fornecedorRepository.save^(fornecedor^);
echo                     return ResponseEntity.ok^(updatedFornecedor^);
echo                 }^)
echo                 .orElse^(ResponseEntity.notFound^(^.build^(^)^);
echo     }
echo.
echo     @DeleteMapping^("/{id}"^)
echo     public ResponseEntity^<Void^> deleteFornecedor^(@PathVariable Long id^) {
echo         if ^(!fornecedorRepository.existsById^(id^)^) {
echo             return ResponseEntity.notFound^(^.build^(^);
echo         }
echo         fornecedorRepository.deleteById^(id^);
echo         return ResponseEntity.noContent^(^.build^(^);
echo     }
echo }
) > "%BASE_DIR%\controller\FornecedorController.java"

echo Criando ProdutoController...
type nul > "%BASE_DIR%\controller\ProdutoController.java"
(
echo package com.controleestoque.api_estoque.controller;
echo.
echo import com.controleestoque.api_estoque.model.Produto;
echo import com.controleestoque.api_estoque.repository.ProdutoRepository;
echo import com.controleestoque.api_estoque.repository.CategoriaRepository;
echo import com.controleestoque.api_estoque.repository.FornecedorRepository;
echo import lombok.RequiredArgsConstructor;
echo import org.springframework.http.HttpStatus;
echo import org.springframework.http.ResponseEntity;
echo import org.springframework.web.bind.annotation.*;
echo.
echo import java.util.List;
echo.
echo @RestController
echo @RequestMapping^("/api/produtos"^)
echo @RequiredArgsConstructor
echo public class ProdutoController {
echo.
echo     private final ProdutoRepository produtoRepository;
echo     private final CategoriaRepository categoriaRepository;
echo     private final FornecedorRepository fornecedorRepository;
echo.
echo     @GetMapping
echo     public List^<Produto^> getAllProdutos^(^) {
echo         return produtoRepository.findAll^(^);
echo     }
echo.
echo     @GetMapping^("/{id}"^)
echo     public ResponseEntity^<Produto^> getProdutoById^(@PathVariable Long id^) {
echo         return produtoRepository.findById^(id^)
echo                 .map^(ResponseEntity::ok^)
echo                 .orElse^(ResponseEntity.notFound^(^.build^(^)^);
echo     }
echo.
echo     @PostMapping
echo     @ResponseStatus^(HttpStatus.CREATED^)
echo     public ResponseEntity^<Produto^> createProduto^(@RequestBody Produto produto^) {
echo         if ^(produto.getCategoria^(^) == null || produto.getCategoria^(^.getId^(^) == null^) {
echo             return ResponseEntity.badRequest^(^.build^(^);
echo         }
echo         categoriaRepository.findById^(produto.getCategoria^(^.getId^(^)^)
echo                 .ifPresent^(produto::setCategoria^);
echo.
echo         if ^(produto.getFornecedores^(^) != null && !produto.getFornecedores^(^.isEmpty^(^)^) {
echo             produto.getFornecedores^(^.clear^(^);
echo             produto.getFornecedores^(^.forEach^(fornecedor -^> {
echo                 fornecedorRepository.findById^(fornecedor.getId^(^)^)
echo                         .ifPresent^(f -^> produto.getFornecedores^(^.add^(f^)^);
echo             }^);
echo         }
echo.
echo         Produto savedProduto = produtoRepository.save^(produto^);
echo         return ResponseEntity.status^(HttpStatus.CREATED^).body^(savedProduto^);
echo     }
echo.
echo     @PutMapping^("/{id}"^)
echo     public ResponseEntity^<Produto^> updateProduto^(@PathVariable Long id, @RequestBody Produto produtoDetails^) {
echo         return produtoRepository.findById^(id^)
echo                 .map^(produto -^> {
echo                     produto.setNome^(produtoDetails.getNome^(^)^);
echo                     produto.setDescricao^(produtoDetails.getDescricao^(^)^);
echo                     produto.setPreco^(produtoDetails.getPreco^(^)^);
echo                     Produto updatedProduto = produtoRepository.save^(produto^);
echo                     return ResponseEntity.ok^(updatedProduto^);
echo                 }^)
echo                 .orElse^(ResponseEntity.notFound^(^.build^(^)^);
echo     }
echo.
echo     @DeleteMapping^("/{id}"^)
echo     public ResponseEntity^<Void^> deleteProduto^(@PathVariable Long id^) {
echo         if ^(!produtoRepository.existsById^(id^)^) {
echo             return ResponseEntity.notFound^(^.build^(^);
echo         }
echo         produtoRepository.deleteById^(id^);
echo         return ResponseEntity.noContent^(^.build^(^);
echo     }
echo }
) > "%BASE_DIR%\controller\ProdutoController.java"

echo.
echo ✅ Concluído! Foram criados:
echo    - 4 repositórios em: %BASE_DIR%\repository\
echo    - 3 controllers em: %BASE_DIR%\controller\
echo.
echo 🚀 Agora você pode compilar e executar sua API!
pause