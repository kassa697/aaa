# partsfinder_app

## App概要 
- 部品検索 and　収納場所確認　application

## 使用Tool('23,6,22現在)
- Github
- Github desktop
- FireBase
- VScode Version1.79.2

## 言語使用
- Flutter/Dart言語を使用する。
- Flutter Version3.7.7→Versionを上げて作成。（test codeはVersion3.7.7で作成）

## Databaseの選定
- Firebase and Firestoreを使用予定。
- cloud Firestore Version4.8.1
- FIrebase core Version2.14.0

# 部品検索アプリ要件定義

## 概要 

- 部品検索App systemはUserが部品情報を検索し早く収納場所を確認する為のAppです。
- UserはAppを通じて部品の仕様・名称・バーコードで検索する。部品の詳細情報や収納場所を結果として取得できます。

## 機能要件
1. User機能
- User登録と認証について Userはアカウントを作成しログインをする事でAppを使用できる。
- 部品検索機能について Userは部品の仕様・名称・バーコードのいずれかの情報で検索できる。
- 関連する詳細情報を結果として取得できる。
- 部品の収納場所表示機能についてUserは部品の収納場所を確認できる。 

## 概要 
2. 管理者機能
- 部品情報の登録・編集・削除について管理者は部品の情報をDataBaseに登録・編集・削除できる。
- 部品の収納場所の管理について管理者は部品の収納場所情報を管理できる。

3. 共通機能
- User管理機能について 管理者はUserアカウントを管理できる。
- ログイン/ログアウト機能について Userと管理者はAppにlogin及びlog outできる。

4. その他の機能要件

- 対応OSの種類について iOS・Android・Linux・Windowsに対応。
- 検索結果や収納場所の表示に遅延がないようにする。
- Userの個人情報・部品データは保護されアクセス制御を行うようにする。
- AppのデザインはUserが直感的な入出力とし簡単な操作でおこなえるようにする。

## 技術要件
- カメラ機能のpackage。
- バーコード機能のpackaging。
- DataBaseのsetting→DBはFireBase and FireStore

- #### ※ 画像認識機能のpackage。
