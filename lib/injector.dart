import 'package:get_it/get_it.dart';
import 'package:projeto_estagio_vendas/data/datasource/app_database.dart';
import 'package:projeto_estagio_vendas/data/repositories/cliente_local_repository_impl.dart';
import 'package:projeto_estagio_vendas/data/repositories/empresa_local_repository_impl.dart';
import 'package:projeto_estagio_vendas/data/repositories/produto_local_repository_impl.dart';
import 'package:projeto_estagio_vendas/data/repositories/produto_venda_local_repository_impl.dart';
import 'package:projeto_estagio_vendas/data/repositories/tabela_cliente_local_repository_impl.dart';
import 'package:projeto_estagio_vendas/data/repositories/tabela_produto_local_repository_impl.dart';
import 'package:projeto_estagio_vendas/data/repositories/venda_database_local_repository_impl.dart';
import 'package:projeto_estagio_vendas/domain/controller/cliente_controller.dart';
import 'package:projeto_estagio_vendas/domain/controller/empresa_controller.dart';
import 'package:projeto_estagio_vendas/domain/controller/lista_venda_controller.dart';
import 'package:projeto_estagio_vendas/domain/controller/produto_controller.dart';
import 'package:projeto_estagio_vendas/domain/controller/produto_venda_controller.dart';
import 'package:projeto_estagio_vendas/domain/controller/tabela_cliente_controller.dart';
import 'package:projeto_estagio_vendas/domain/controller/tabela_produto_controller.dart';
import 'package:projeto_estagio_vendas/domain/controller/venda_controller.dart';
import 'package:projeto_estagio_vendas/domain/repositories/cliente_local_repository.dart';
import 'package:projeto_estagio_vendas/domain/repositories/empresa_local_repository.dart';
import 'package:projeto_estagio_vendas/domain/repositories/lista_venda_local_repository.dart';
import 'package:projeto_estagio_vendas/domain/repositories/produto_local_repository.dart';
import 'package:projeto_estagio_vendas/domain/repositories/produto_venda_local_repository.dart';
import 'package:projeto_estagio_vendas/domain/repositories/tabela_cliente_local_repository.dart';
import 'package:projeto_estagio_vendas/domain/repositories/tabela_produto_local_repository.dart';
import 'package:projeto_estagio_vendas/domain/repositories/venda_local_repository.dart';
import 'package:projeto_estagio_vendas/external/datasource/app_database_impl.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/cadastrar_cliente/cadastrar_cliente_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/empresa/empresa_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/listar_venda/lista_venda_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/pedido/pedido_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/selecionar_cliente/selecionar_cliente_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/cadastrar_produto/cadastrar_produto_bloc.dart';
import 'data/repositories/lista_venda_local_repository_impl.dart';

final getIt = GetIt.instance;

abstract class Injector {
  late final GetIt getIt;

  Injector(this.getIt);

  void dispose();
}

class InjectorImpl extends Injector {
  InjectorImpl._(super.getIt);

  static Future<Injector> inicializeDependencia() async {
    final getIt = GetIt.instance..allowReassignment = true;

    ///DATABASE ----------------------------------------------------------------
    getIt.registerSingletonAsync<ApplicationDatabase>(
        ApplicationDatabaseImpl.initialize);

    ///LOCAL REPOSITORY --------------------------------------------------------
    getIt.registerSingleton<ClienteLocalRepository>(
      ClienteLocalRepositoryImpl(
        await getIt.getAsync<ApplicationDatabase>(),
      ),
    );

    getIt.registerSingleton<TabelaClienteLocalRepository>(
      TabelaClienteLocalRepositoryImpl(
        await getIt.getAsync<ApplicationDatabase>(),
      ),
    );

    getIt.registerSingleton<ProdutoLocalRepository>(
      ProdutoLocalRepositoryImpl(
        await getIt.getAsync<ApplicationDatabase>(),
      ),
    );

    getIt.registerSingleton<TabelaProdutoLocalRepository>(
      TabelaProdutoLocalRepositoryImpl(
        await getIt.getAsync<ApplicationDatabase>(),
      ),
    );

    getIt.registerSingleton<ListaVendaLocalRepository>(
      ListaVendaLocalRepositoryImpl(
        await getIt.getAsync<ApplicationDatabase>(),
      ),
    );

    getIt.registerSingleton<VendaDatabaseLocalRepository>(
      VendaDatabaseLocalRepositoryImpl(
        await getIt.getAsync<ApplicationDatabase>(),
      ),
    );

    getIt.registerSingleton<ProdutoVendaLocalRepository>(
      ProdutoVendaLocalRepositoryImpl(
        await getIt.getAsync<ApplicationDatabase>(),
      ),
    );

    getIt.registerSingleton<EmpresaLocalRepository>(
      EmpresaLocalRepositoryImpl(
        await getIt.getAsync<ApplicationDatabase>(),
      ),
    );

    ///CONTROLLERS -------------------------------------------------------------
    getIt.registerSingleton<ClienteController>(
      ClienteController(
        getIt<ClienteLocalRepository>(),
      ),
    );

    getIt.registerSingleton<TabelaClienteController>(
      TabelaClienteController(
        getIt<TabelaClienteLocalRepository>(),
      ),
    );

    getIt.registerSingleton<ProdutoController>(
      ProdutoController(
        getIt<ProdutoLocalRepository>(),
      ),
    );

    getIt.registerSingleton<TabelaProdutoController>(
      TabelaProdutoController(
        getIt<TabelaProdutoLocalRepository>(),
      ),
    );

    getIt.registerSingleton<ListaVendaController>(
      ListaVendaController(getIt<ListaVendaLocalRepository>()),
    );

    getIt.registerSingleton<VendaController>(
      VendaController(
        getIt<VendaDatabaseLocalRepository>(),
      ),
    );

    getIt.registerSingleton<ProdutoVendaController>(
      ProdutoVendaController(
        getIt<ProdutoVendaLocalRepository>(),
      ),
    );

    getIt.registerSingleton<EmpresaController>(
      EmpresaController(
        getIt<EmpresaLocalRepository>(),
      ),
    );

    ///BLOC --------------------------------------------------------------------
    getIt.registerSingleton<CadastrarProdutoBloc>(
      CadastrarProdutoBloc(
        getIt.get<ProdutoController>(),
      ),
    );

    getIt.registerSingleton<CadastrarClienteBloc>(
      CadastrarClienteBloc(
        getIt.get<ClienteController>(),
      ),
    );

    getIt.registerSingleton<PedidoBloc>(
      PedidoBloc(
        getIt.get<VendaController>(),
        getIt.get<TabelaProdutoController>(),
        getIt.get<TabelaClienteController>(),
        getIt.get<ProdutoVendaController>(),
        getIt.get<EmpresaController>()
      ),
    );

    getIt.registerSingleton<ListaVendaBloc>(
      ListaVendaBloc(
        getIt.get<ListaVendaController>(),
        getIt.get<ProdutoVendaController>(),
      ),
    );

    getIt.registerSingleton<TabelaProdutoBloc>(
      TabelaProdutoBloc(
        getIt.get<TabelaProdutoController>(),
      ),
    );

    getIt.registerSingleton<TabelaClienteBloc>(
      TabelaClienteBloc(
        getIt.get<TabelaClienteController>(),
      ),
    );

    getIt.registerSingleton<EmpresaBloc>(
      EmpresaBloc(
        getIt.get<EmpresaController>(),
      ),
    );

    getIt.registerSingleton<SelecionarClienteBloc>(
      SelecionarClienteBloc(
          getIt.get<TabelaClienteController>(),
      ),
    );

    return InjectorImpl._(getIt);
  }

  @override
  void dispose() {
    getIt.get<CadastrarProdutoBloc>().close();
    getIt.get<CadastrarClienteBloc>().close();
    getIt.get<PedidoBloc>().close();
    getIt.get<ListaVendaBloc>().close();
    getIt.get<TabelaProdutoBloc>().close();
    getIt.get<TabelaClienteBloc>().close();
    getIt.get<EmpresaBloc>().close();
  }
}
