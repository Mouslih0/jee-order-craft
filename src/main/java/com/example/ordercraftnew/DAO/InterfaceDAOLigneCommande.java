package com.example.ordercraftnew.DAO;

import com.example.ordercraftnew.Model.Commande;
import com.example.ordercraftnew.Model.CommandeProduit;

public interface InterfaceDAOLigneCommande {
    CommandeProduit add(CommandeProduit commandeProduit);
    CommandeProduit getById(int id);
}
