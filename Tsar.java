public class Tsar {
    public static Node tsar(Node list, char srch, char repl) {
        if (list.next == null)
            return new Node(list.val, null);
        if (list.val == srch)
            return new Node(repl, tsar(list.next, srch, repl));
        return new Node(list.val, tsar(list.next, srch, repl));
    }

    public static void main(String[] args) {
        Node n = new Node('a', new Node('b', new Node('c', new Node('d', null))));
        for (Node i = n; i != null; i = i.next)
            System.out.print(i.val + " ");
        System.out.println();
        n = tsar(n, 'b', 'z');
        for (Node i = n; i != null; i = i.next)
            System.out.print(i.val + " ");
        System.out.println();
    }
}