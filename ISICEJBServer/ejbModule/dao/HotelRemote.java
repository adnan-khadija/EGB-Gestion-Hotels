package dao;

import entities.Hotel;
import jakarta.ejb.Remote;

@Remote
public interface HotelRemote extends IDaoRemote<Hotel>{

}
