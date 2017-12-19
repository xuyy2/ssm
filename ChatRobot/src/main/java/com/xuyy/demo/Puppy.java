package com.xuyy.demo;

public class Puppy {
////    每个类都有至少调用一个构造方法，没有会默认一个
//
//    public Puppy(String name){
//        System.out.println("dog's name is :"+name);
//    }
//
//    public static void main(String []args){
//        Puppy myPuppy = new Puppy("tommy");
//    }
    int puppyAge;

    public Puppy(String name){
        System.out.println("dog's name is:"+name);
    }

    public int getPuppyAge() {
        System.out.println("dog's age:"+puppyAge);
        return puppyAge;
    }

    public void setPuppyAge(int puppyAge) {
        this.puppyAge = puppyAge;
    }

    public static void main(String[] args) {
        Puppy myPuppy = new Puppy("Tommy");
        myPuppy.setPuppyAge(2);
        myPuppy.getPuppyAge();
        System.out.println("variable:"+myPuppy.getPuppyAge());
    }



}
