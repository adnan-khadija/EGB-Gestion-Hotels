import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import dao.IDaoRemote;
import entities.Hotel;
import entities.Ville;

public class TestJHotel {

    public static IDaoRemote<Hotel> lookUpHotelRemote() throws NamingException {
        final Hashtable<String, String> jndiProperties = new Hashtable<>();
        jndiProperties.put(Context.INITIAL_CONTEXT_FACTORY, "org.wildfly.naming.client.WildFlyInitialContextFactory");
        jndiProperties.put(Context.PROVIDER_URL, "http-remoting://localhost:8084");
        final Context context = new InitialContext(jndiProperties);

        return (IDaoRemote<Hotel>) context.lookup("ejb:ISICEJBEAR/ISICEJBServer/kenza!dao.IDaoRemote");
    }

    public static IDaoRemote<Ville> lookUpVilleRemote() throws NamingException {
        final Hashtable<String, String> jndiProperties = new Hashtable<>();
        jndiProperties.put(Context.INITIAL_CONTEXT_FACTORY, "org.wildfly.naming.client.WildFlyInitialContextFactory");
        jndiProperties.put(Context.PROVIDER_URL, "http-remoting://localhost:8084");
        final Context context = new InitialContext(jndiProperties);

        return (IDaoRemote<Ville>) context.lookup("ejb:ISICEJBEAR/ISICEJBServer/kenza!dao.IDaoRemote");
    }

    public static void main(String[] args) {
        try {
            IDaoRemote<Hotel> daoHotel = lookUpHotelRemote();
            IDaoRemote<Ville> daoVille = lookUpVilleRemote();

            daoHotel.create(new Hotel("nomHotel", "adresseHotel", "telephoneHotel", daoVille.findById(1)));

            for (Hotel hotel : daoHotel.findAll()) {
                System.out.println("Nom de l'hôtel : " + hotel.getNom()+hotel.getAdresse()+hotel.getTelephone()+hotel.getVille().getNom());
            }
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
}
