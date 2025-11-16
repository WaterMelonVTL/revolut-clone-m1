CREATE MATERIALIZED VIEW MV_CLIENT_DATE_LIEU_AGG
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT
    c.type_client,
    c.profession,
    c.segment_comportemental,
    d.annee,
    d.nom_mois,
    d.numero_mois,
    l.pays,
    i.est_frauduleux,
    i.est_bloque,
    COUNT(*) AS nb_transactions,
    SUM(f.montant_total) AS sum_montant_total,
    SUM(CASE WHEN i.est_frauduleux = 1 THEN f.montant_total ELSE 0 END) AS sum_montant_frauduleux,
    COUNT(DISTINCT f.client_id) AS nb_clients_uniques,
    SUM(f.montant_total) AS agg_sum_montant,
    COUNT(f.montant_total) AS agg_count_montant
FROM
    FAIT_TRANSACTIONS_DETAILLE f
JOIN
    VUE_CLIENTS_DETAILLE c ON f.client_id = c.client_id
JOIN
    VUE_DATE_DETAILLE d ON f.date_id = d.date_id
JOIN
    VUE_LIEUX_DETAILLE l ON f.lieu_id = l.lieu_id
JOIN
    VUE_INFO_TRANSACTION_DETAILLE i ON f.info_transaction_id = i.info_transaction_id
GROUP BY
    c.type_client,
    c.profession,
    c.segment_comportemental,
    d.annee,
    d.nom_mois,
    d.numero_mois,
    l.pays,
    i.est_frauduleux,
    i.est_bloque;

CREATE MATERIALIZED VIEW MV_OPERATION_TEMPS_AGG
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT
    op.type_canal,
    op.type_dispositif,
    op.libelle_operation,
    t.periode_journee,
    t.tranche_horaire,
    COUNT(*) AS nb_transactions,
    SUM(f.score_fraude) AS sum_score_fraude,
    COUNT(f.score_fraude) AS count_score_fraude,
    SUM(f.duree_traitement_ms) AS sum_duree_traitement,
    COUNT(f.duree_traitement_ms) AS count_duree_traitement
FROM
    FAIT_TRANSACTIONS_DETAILLE f
JOIN
    VUE_MODES_OPERATION_DETAILLE op ON f.mode_operation_id = op.mode_operation_id
JOIN
    VUE_TEMPS_DETAILLE t ON f.heure_id = t.heure_id
GROUP BY
    op.type_canal,
    op.type_dispositif,
    op.libelle_operation,
    t.periode_journee,
    t.tranche_horaire;

CREATE MATERIALIZED VIEW MV_FINANCE_MARKETING_AGG
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT
    m.categorie_marchand,
    dev.nom_devise,
    dev.est_crypto,
    p.nom_plan,
    op.libelle_operation,
    COUNT(*) AS nb_transactions,
    SUM(f.montant_total) AS sum_montant_total,
    SUM(f.frais) AS sum_frais,
    SUM(f.cashback_gagne) AS sum_cashback_gagne,
    SUM(CASE WHEN op.libelle_operation = 'depot' THEN f.montant_total ELSE 0 END) AS sum_depots,
    SUM(CASE WHEN op.libelle_operation IN ('retrait', 'paiement', 'virement') THEN f.montant_total ELSE 0 END) AS sum_sorties
FROM
    FAIT_TRANSACTIONS_DETAILLE f
JOIN
    VUE_MARCHANDS_DETAILLE m ON f.marchand_id = m.marchand_id
JOIN
    VUE_DEVISES_DETAILLE dev ON f.devise_id = dev.devise_id
JOIN
    VUE_PLANS_DETAILLE p ON f.plan_id = p.plan_id
JOIN
    VUE_MODES_OPERATION_DETAILLE op ON f.mode_operation_id = op.mode_operation_id
GROUP BY
    m.categorie_marchand,
    dev.nom_devise,
    dev.est_crypto,
    p.nom_plan,
    op.libelle_operation;
