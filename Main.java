import java.time.LocalDate;

public class Main {
    public static void main(String[] args) {
        // Criação de objetos Departamento e Funcionário
        Departamento dep1 = new Departamento("Desenvolvimento", "Andar 3", "João Silva", 15, 123);
        Funcionario func1 = new Funcionario("Maria", 30, "Engenheiro", 5000, 1);
        Funcionario func2 = new Funcionario("Carlos", 28, "Analista", 4500, 2);

        // Criação de projetos
        ProjetoDesenvolvimento p1 = new ProjetoDesenvolvimento("Sistema de Gestão", 6, 100000, "Desenvolvimento", true, LocalDate.of(2023, 10, 1), "Java");
        ProjetoDesenvolvimento p2 = new ProjetoDesenvolvimento("Portal Web", 4, 60000, "Desenvolvimento", false, LocalDate.of(2023, 11, 1), "Python");

        // Arrays de Funcionários e Projetos
        Funcionario[] funcionarios = {func1, func2};
        ProjetoDesenvolvimento[] projetos = {p1, p2};

        // Associação de Funcionários a Projetos
        for (Funcionario funcionario : funcionarios) {
            if (funcionario.getCargo().equals("Engenheiro") && p1.isAprovado()) {
                System.out.println("Funcionário " + funcionario.getNome() + " está alocado no " + p1.getNomeProjeto());
            } else if (funcionario.getCargo().equals("Analista") && p2.isAprovado()) {
                System.out.println("Funcionário " + funcionario.getNome() + " está alocado no " + p2.getNomeProjeto());
            }
        }

        // Listar todos os projetos aprovados com prazo de entrega
        System.out.println("\nProjetos Aprovados:");
        for (ProjetoDesenvolvimento projeto : projetos) {
            if (projeto.isAprovado()) {
                System.out.println(projeto);
            }
        }
    }
}

// Classe Departamento
class Departamento {
    private String nome;
    private String localizacao;
    private String chefeDepartamento;
    private int numeroFuncionarios;
    private int codigoDepartamento;

    // Construtor
    public Departamento(String nome, String localizacao, String chefeDepartamento, int numeroFuncionarios, int codigoDepartamento) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.chefeDepartamento = chefeDepartamento;
        this.numeroFuncionarios = numeroFuncionarios;
        this.codigoDepartamento = codigoDepartamento;
    }

    // Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getChefeDepartamento() {
        return chefeDepartamento;
    }

    public void setChefeDepartamento(String chefeDepartamento) {
        this.chefeDepartamento = chefeDepartamento;
    }

    public int getNumeroFuncionarios() {
        return numeroFuncionarios;
    }

    public void setNumeroFuncionarios(int numeroFuncionarios) {
        this.numeroFuncionarios = numeroFuncionarios;
    }

    public int getCodigoDepartamento() {
        return codigoDepartamento;
    }

    public void setCodigoDepartamento(int codigoDepartamento) {
        this.codigoDepartamento = codigoDepartamento;
    }
}

// Classe Funcionário
class Funcionario {
    private String nome;
    private int idade;
    private String cargo;
    private double salario;
    private int codigoFuncionario;

    // Construtor
    public Funcionario(String nome, int idade, String cargo, double salario, int codigoFuncionario) {
        this.nome = nome;
        this.idade = idade;
        this.cargo = cargo;
        this.salario = salario;
        this.codigoFuncionario = codigoFuncionario;
    }

    // Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public int getCodigoFuncionario() {
        return codigoFuncionario;
    }

    public void setCodigoFuncionario(int codigoFuncionario) {
        this.codigoFuncionario = codigoFuncionario;
    }
}

// Classe Projeto
class Projeto {
    private String nomeProjeto;
    private int duracaoMeses;
    private double orcamento;
    private String departamentoResponsavel;
    private boolean aprovado;
    private LocalDate dataInicio;

    // Construtor
    public Projeto(String nomeProjeto, int duracaoMeses, double orcamento, String departamentoResponsavel, boolean aprovado, LocalDate dataInicio) {
        this.nomeProjeto = nomeProjeto;
        this.duracaoMeses = duracaoMeses;
        this.orcamento = orcamento;
        this.departamentoResponsavel = departamentoResponsavel;
        this.aprovado = aprovado;
        this.dataInicio = dataInicio;
    }

    // Getters e Setters
    public String getNomeProjeto() {
        return nomeProjeto;
    }

    public void setNomeProjeto(String nomeProjeto) {
        this.nomeProjeto = nomeProjeto;
    }

    public int getDuracaoMeses() {
        return duracaoMeses;
    }

    public void setDuracaoMeses(int duracaoMeses) {
        this.duracaoMeses = duracaoMeses;
    }

    public double getOrcamento() {
        return orcamento;
    }

    public void setOrcamento(double orcamento) {
        this.orcamento = orcamento;
    }

    public String getDepartamentoResponsavel() {
        return departamentoResponsavel;
    }

    public void setDepartamentoResponsavel(String departamentoResponsavel) {
        this.departamentoResponsavel = departamentoResponsavel;
    }

    public boolean isAprovado() {
        return aprovado;
    }

    public void setAprovado(boolean aprovado) {
        this.aprovado = aprovado;
    }

    public LocalDate getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(LocalDate dataInicio) {
        this.dataInicio = dataInicio;
    }
}

// Classe ProjetoDesenvolvimento (herda de Projeto)
class ProjetoDesenvolvimento extends Projeto {
    private String tecnologiaUtilizada;

    // Construtor
    public ProjetoDesenvolvimento(String nomeProjeto, int duracaoMeses, double orcamento, String departamentoResponsavel, boolean aprovado, LocalDate dataInicio, String tecnologiaUtilizada) {
        super(nomeProjeto, duracaoMeses, orcamento, departamentoResponsavel, aprovado, dataInicio);
        this.tecnologiaUtilizada = tecnologiaUtilizada;
    }

    // Getters e Setters
    public String getTecnologiaUtilizada() {
        return tecnologiaUtilizada;
    }

    public void setTecnologiaUtilizada(String tecnologiaUtilizada) {
        this.tecnologiaUtilizada = tecnologiaUtilizada;
    }

    // Método para calcular e exibir o prazo de entrega do projeto
    public LocalDate getPrazoEntrega() {
        return getDataInicio().plusMonths(getDuracaoMeses());
    }

    @Override
    public String toString() {
        return "Projeto: " + getNomeProjeto() + ", Tecnologia Utilizada: " + tecnologiaUtilizada + ", Aprovado: " + isAprovado() + ", Prazo de Entrega: " + getPrazoEntrega();
    }
}
