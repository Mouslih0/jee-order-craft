<%@ page import="java.util.List" %>
<%@ page import="com.example.ordercraftnew.Model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id_commande"));

    CommandeProduit commandeProduit = null;
    if(request.getAttribute("commandeProduit") != null)
    {
        commandeProduit = (CommandeProduit) request.getAttribute("commandeProduit");
    }

    Client client = null;
    if(request.getAttribute("client") != null)
    {
        client = (Client) request.getAttribute("client");
    }

    Commande commande = null;
    if(request.getAttribute("commande") != null){
        commande = (Commande) request.getAttribute("commande");
    }

    List<CommandeProduit> commandeProduits = null;
    if(request.getAttribute("commandeProduits") != null){
        commandeProduits = (List<CommandeProduit>) request.getAttribute("commandeProduits");
    }

    List<Produit> produits = null;
    if(request.getAttribute("produits") != null){
        produits = (List<Produit>) request.getAttribute("produits");
    }

    List<Etat> etats = null;
    if(request.getAttribute("etats") != null)
    {
        etats = (List<Etat>) request.getAttribute("etats");
    }

    assert client != null;
    assert commandeProduits != null;
    assert produits != null;
    assert etats != null;
    assert commande != null;
    assert commandeProduit != null;
%>

<html>
<head>
    <title>Gestion des produits</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<div class="min-h-full">
    <%@ include file="nav.jsp" %>
    <div class="py-10">
        <main>
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <!-- Replace with your content -->
                <div class="lg:grid lg:grid-cols-6 lg:gap-x-5">
                    <div class="space-y-6 sm:px-6 lg:px-0 lg:col-span-9">
                        <form action="<%=request.getContextPath()%>/commande-situation/update" method="post">
                            <div class="shadow sm:rounded-md sm:overflow-hidden">
                                <div class="bg-white py-6 px-4 space-y-6 sm:p-6">
                                    <div>
                                        <h3 class="text-lg leading-6 font-medium text-gray-900">Status updating</h3>
                                        <p class="mt-1 text-sm text-gray-500">Use a permanent status where you can update status of one commande.</p>
                                    </div>

                                    <div class="grid grid-cols-6 gap-6">
                                        <div class="col-span-6 sm:col-span-3">
                                            <label for="id_commande" class="block text-sm font-medium text-gray-700">Commande id</label>
                                            <input type="text" name="id_commande" readonly disabled placeholder="commande id" value="<%=commande.getId()%>" id="id_commande" autocomplete="given-name" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                        </div>

                                        <div class="col-span-6 sm:col-span-3">
                                            <label for="client" class="block text-sm font-medium text-gray-700">Client name</label>
                                            <input type="text" name="client" readonly disabled placeholder="client name" value="<%= client.getName() != null ? client.getName() : "" %>" id="client" autocomplete="given-name" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                        </div>

                                        <div class="col-span-6">
                                            <label for="id_produit" class="block text-sm font-medium text-gray-700">Product name commander</label>
                                            <div class="mt-1 sm:mt-0 sm:col-span-2">
                                                <nav class="h-full overflow-y-auto" aria-label="Directory">
                                                    <div class="relative">
                                                        <ul role="list" id="id_produit" class="relative z-0 divide-y divide-gray-200">
                                                    <%
                                                        for (CommandeProduit cp : commandeProduits){
                                                            for (Produit p : produits){
                                                                if(cp.getCommande().getId() == id && cp.getProduit().getId() == p.getId()){
                                                    %>
                                                                <li class="bg-white">
                                                                    <div class="relative px-2 py-2 flex items-center space-x-3 hover:bg-gray-50 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-500">
                                                                        <div class="flex-1 min-w-0">
                                                                            <a href="#" class="focus:outline-none">
                                                                                <!-- Extend touch target to entire panel -->
                                                                                <span class="absolute inset-0" aria-hidden="true"></span>
                                                                                <p class="text-sm font-medium text-gray-900"><%=p.getName()%></p>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                    <%
                                                                }
                                                            }
                                                        }
                                                    %>
                                                        </ul>
                                                    </div>
                                                </nav>
                                            </div>
                                        </div>

                                        <div class="col-span-6 sm:col-span-4">
                                            <label for="address_livraison" class="block text-sm font-medium text-gray-700">Address livraison</label>
                                            <div class="mt-1">
                                                <textarea id="address_livraison" readonly disabled name="address_livraison"  rows="3" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border border-gray-300 rounded-md" placeholder="address livraison"><%= commande.getAddress_livraison() != null ? commande.getAddress_livraison() : "" %></textarea>
                                            </div>
                                        </div>
                                        <div class="col-span-6">
                                            <label for="etat_commande" class="block text-sm font-medium text-gray-700">Etat commande</label>
                                            <div class="mt-1 sm:mt-0 sm:col-span-2">
                                                <select id="etat_commande" name="etat_commande" autocomplete="etat_commande" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                                    <option>-- Commande état --</option>
                                                    <% for(Etat etat : etats){ %>
                                                    <option value="<%=etat.name()%>"><%= etat.name() %></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
                                    <button type="submit" class="bg-indigo-600 border border-transparent rounded-md shadow-sm py-2 px-4 inline-flex justify-center text-sm font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /End replace -->
            </div>
        </main>
    </div>
</html>