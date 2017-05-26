package curs_07_streams;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import static java.util.Comparator.comparing;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import static java.util.stream.Collectors.groupingBy;
import java.util.stream.Stream;

class Persoana implements Comparable
{
    String nume;
    int varsta;
    double salariu;
    String[] competente;

    public Persoana(String nume, int varsta, double salariu, String[] competente)
    {
        this.nume = nume;
        this.varsta = varsta;
        this.salariu = salariu;
        this.competente = competente;
    }
    
    @Override
    public int hashCode()
    {
        int hash = 7;
        hash = 79 * hash + Objects.hashCode(this.nume);
        hash = 79 * hash + this.varsta;
        hash = 79 * hash + (int) (Double.doubleToLongBits(this.salariu) ^ (Double.doubleToLongBits(this.salariu) >>> 32));
        return hash;
    }

    @Override
    public boolean equals(Object obj)
    {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final Persoana other = (Persoana) obj;
        if (this.varsta != other.varsta)
            return false;
        if (Double.doubleToLongBits(this.salariu) != Double.doubleToLongBits(other.salariu))
            return false;
        if (!Objects.equals(this.nume, other.nume))
            return false;
        return true;
    }

    @Override
    public String toString()
    {
        return nume + " " + varsta + " " + salariu + " " + Arrays.asList(competente);
    }

    public String getNume()
    {
        return nume;
    }

    public int getVarsta()
    {
        return varsta;
    }

    public double getSalariu()
    {
        return salariu;
    }

    public String[] getCompetente()
    {
        return competente;
    }

    public void setCompetente(String[] competente)
    {
        this.competente = competente;
    }

    @Override
    public int compareTo(Object o)
    {
        return this.nume.compareTo(((Persoana)o).nume);
    }
}

public class Curs_07_Streams
{
    public static void main(String[] args)
    {
        ArrayList<Persoana> lpers = new ArrayList<>();
        
        lpers.add(new Persoana("Ionescu Ion", 35, 1500.5, new String[]{"lb. engleză","permis de conducere"}));
        lpers.add(new Persoana("Popescu Mihai", 27, 2000, new String[]{"ECDL","lb. engleză", "permis de conducere"}));
        lpers.add(new Persoana("Ionescu Georgiana", 35, 3500.75, new String[]{"ECDL"}));
        lpers.add(new Persoana("Bunea Stefan", 33, 2700, new String[]{"lb. chineză"}));
        lpers.add(new Persoana("Popescu Alina", 33, 5000.1, new String[]{"ECDL","permis de conducere"}));
        
        //ArrayList<Persoana> lnoua = new ArrayList<>();
        /*
        for(Persoana p : lpers)
            if(p.getVarsta() >= 30)
                lnoua.add(p);
        
        Collections.sort(lnoua, (p1, p2) -> p1.getNume().compareTo(p2.getNume()));
        
        for(Persoana p : lnoua)
            System.out.println(p);
        */
        
        /*
        lnoua = (ArrayList)lpers.stream().filter(p -> p.getVarsta() >= 30).sorted(Comparator.comparing(Persoana::getNume)).collect(Collectors.toList());
        lnoua.forEach(System.out::println);
        
        lpers.stream().filter(p -> p.getVarsta() >= 30).sorted(Comparator.comparing(Persoana::getNume)).forEach(System.out::println);
        */
        
        //lpers.stream().filter(p -> p.getVarsta() >= 50).sorted(Comparator.comparing(Persoana::getNume)).forEach(System.out::println);
        //Double ts = lpers.stream().map(Persoana::getSalariu).reduce(0.0, (x, y) -> x + y);
        //System.out.println("Total salarii: " + ts);
        
        //lpers.stream().collect(groupingBy(Persoana::getVarsta)).forEach((v,lp) -> System.out.println(v + ": " + lp));
        
        Map<Integer, List<Persoana>> lgv = lpers.stream().collect(groupingBy(Persoana::getVarsta));
        System.out.println(lgv);
        
        //double st = lpers.stream().collect(Collectors.summingDouble(Persoana::getSalariu));
        //System.out.println("Total salarii: " + st);
        
       //Map<Integer, Double> lgs = lpers.stream().collect(groupingBy(Persoana::getVarsta, Collectors.summingDouble(Persoana::getSalariu)));
        //System.out.println(lgs);
        /*
        Map<Integer, List<Persoana> > lgv=lpers.stream().collect(Collectors.groupingBy(Persoana::getVarsta));
        System.out.println(lgv);
        Map<Integer, Double> lgs=lpers.stream().collect(Collectors.groupingBy(Persoana::getVarsta, Collectors.summingDouble(Persoana::getSalariu)));
        System.out.println(lgs);
          */
//lgv.forEach((v, lp)->System.out.println(v+" "+lp));
        //Persoana vmax = lpers.stream().collect(Collectors.maxBy(comparing(Persoana::getVarsta))).get();
        //System.out.println(vmax);
        
        //lpers.stream().sorted(Comparator.comparing(Persoana::getVarsta).reversed()).limit(3).forEach(System.out::println);
        //lpers.stream().distinct().forEach(System.out::println);
        //lpers.stream().sorted((p1,p2) -> p1.getVarsta() - p2.getVarsta()).forEach(System.out::println);
        
        //lpers.stream().map(Persoana::getVarsta).sorted().distinct().forEach(System.out::println);
        
        //lpers.stream().map(Persoana::getCompetente).distinct().forEach(System.out::println);
        //lpers.stream().flatMap(p -> Stream.of(p.getCompetente())).distinct().forEach(System.out::println);
        
        //System.out.println(lpers.stream().min((p1,p2) -> p1.getVarsta() - p2.getVarsta()));
        
        //System.out.println(lpers.stream().anyMatch(p -> p.getSalariu() >= 3000));
        
        //String s = lpers.stream().filter(p -> p.getSalariu() >= 3000).map(Persoana::getNume).collect(Collectors.joining("\n"));
        //System.out.println(s);
        
        //List<Persoana> lnoua = lpers.stream().filter(p -> p.getSalariu() >= 3000).collect(Collectors.toList());
        
        //System.out.println(lnoua);
        //lpers.stream().forEach(System.out::println);
        
        //lpers.stream().sorted().forEach(System.out::println);
        
        //Stream.generate(()->Math.random()).limit(10).forEach(System.out::println);
        
        //Stream.iterate(1, x -> 2*x).limit(5).forEach(System.out::println);
        //Stream.iterate(BigInteger.ONE, (BigInteger x) -> BigInteger.valueOf(2).multiply(x)).limit(100).forEach(System.out::println);
        
        //IntStream.rangeClosed(1, 5).forEach(System.out::println);
        
        //System.out.println(lpers.stream().max(Comparator.comparing(Persoana::getVarsta)));
        
       // lpers.stream().distinct().forEach(System.out::println);
        //lpers.stream().map(Persoana::getVarsta).distinct().forEach(System.out::println);
        //
        /*
        HashMap<Integer, Persoana> m=new HashMap();
        
        Predicate<Persoana> criteriu=p->{
            if(!m.containsKey(p.getVarsta()))
            {
                m.put(p.getVarsta(), p);
                return true;
            }
            else
                return false;
                
        };
        */
        //lpers.stream().filter(criteriu).forEach(System.out::println);
            
           
     // String w=  lpers.stream().collect(Collectors.joining());
      //  String sir="progranare";
     //   char x=sir.charAt(100);
       // System.out.println(x);
        /*
        System.out.println(sir.indexOf("a"));
        System.out.println(sir.indexOf("nana"));
        String r="Ana re 10 mere si vrea sa dea 9 si mai vrea 11";
        String nr[]=r.split("[^0-9]+");
        for(String aux:nr)
            System.out.println(aux+" ");
                */
       /* 
        StringBuilder t = new StringBuilder("Java");
        t.append(" nota 10");
        System.out.println(t);
               */
    //lpers.stream().distinct().forEach(System.out::println);
       // lpers.stream().map(Persoana::getVarsta).disti
        //System.out.println(lpers.stream().max(Comparator.comparing(Persoana::getVarsta)));
    lpers.stream().sorted(Comparator.comparing(Persoana::getVarsta).reversed().thenComparing(Persoana::getSalariu)).forEach(System.out::println);
    }
}

